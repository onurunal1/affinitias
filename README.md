# Affinitas 
This application is fetching all user list from API that is provided by nischenspringer.de.

Here is the file project structure that I created; 

Core
|.Model
|..Detail -> Provide the user detail model object which is extended JSONModel 
|..List -> Provide the user list model object which is extended JSONModel
|..AFMobileApiManager --> Provide the generic GET calls which enable to fetch the data that comes from API 
|.View --> Provide the storyboard
|.Controller
|..CustomCells -> I have designed custom cells which used on user list and user detail view controller. All cells are setted by auto-layout constants. 
|..ViewController(s)

##Screenshots:
##User Feed View :
![alt tag] (https://github.com/onurunal1/affinitias/blob/master/List.png)
##User Detail Feed View:
![alt tag] (https://github.com/onurunal1/affinitias/blob/master/Detail.png)
