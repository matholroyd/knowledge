# EmberJS - My Understanding

## Application

Application will auto-start itself (i.e. call `initialize()` in a jQuery `ready`), however its a good idea to explicitly initialize as any other code will depend on App running for e.g. bindings to be triggered.


## Routes 

Routes can take advantage of nested functionality, e.g. 

    project: Ember.Route.extend(
      route: '/project/:id'

      connectOutlets: (router, project) ->
        router.get('applicationController').connectOutlet('project', project)

      select_photos: Ember.Route.extend(
        route: '/select-photos'
        connectOutlets: (router) ->  
          router.get('projectController').connectOutlet('body', 'photoSources')
       )

In above example, if viewing the `/project/1/select_photos` route, then:
  
1. applicationController is connected to application view
1. ProjectController controller is (not sure...instantiated?)
1. ProjectView is inserted into the main `{{outlet}}` in the application view
1. if PhotoSourcesController exists, then PhotoSourcesController is (not sure...instantiated?)
1. PhotoSourcesView is inserted into the `{{outlet body}}`


### Deserializing

When routers are deserializing (i.e. loading routes from URL in contrast to changing route programmatically via `router.transtionTo`), _all_ deserializing happens before any `connectOutlets` is called. This means that if there are nested deserializion going on, e.g. album + album photos, then any nested deserialization (album photos in this case) cannot rely on the parent controller (e.g. albumController) to have its content set.  Hence nested deserialization should only decode e.g. an `id` and not the actual object you want. Rather getting the object should occur in the nested `connectOutlets` or the nested controller.


## Views

For data used in a view, it will auto update itself so longs as

1. The data is a property
1. The data's property dependency is correctly set, e.g. commonly need to depend on 'arrayRef.@each' and not 'arrayRef'

### Inline views

If don't want to create a template but want to get the power of views, can create inline views, even for collections/arrays.

    {{#each people}}
      {{#view App.PersonView contentBinding="this"}}
        <li>
          {{#if male}}
            Mr
          {{else}}
            Ms
          {{/if}}
          {{firstName}} {{lastName}}
        </li>
      {{/view}}
    {{/each}}

## Debugging

Some problems I found with view/template/controller setup

- View's don't throw errors if e.g. the attribute `{{name}}` is missing, hence if not getting any feedback, could be for multiple reasons such as controller loading wrong object, object not updating, etc.
- Still daunted by how to test the whole router/view/controller/template setup.
  - How should linkage between 'sections' be done? E.g. how should an overlay get its content if its dependent on content behind it?

Ran into a absolute pain in the arse problem when had accidentally written `{{outlet name}}` twice in one template. Errors I was getting were something like `can't update object that has already been destroyed`. Makes sense as 2nd outlet was trying to refresh itself when the first outlet had been destroyed (which both pointed to the same view).

