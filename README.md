Exchanjor -> Exhange + Ninjor (the best ninja ever :D)

*Objectives of the Project*

   * To create the MVP (Minimal Viable Product) of an app that would fetch the current USD exchange rate from 'coinlayer.com' and display those rates.
   * The capabilities of adding and removing favorites rates, so you can easily find what you're looking for.
   * Be able to see the last fetched rates even if you don't have internet at the time of launching the app.
   * Fast and simple UI, so you can easily identify what's happening in the new fetched rates.

*App architecture (and some design choices)*

  * I've aimed to create a MVP, therefore, some choices were made only with this in mind. But some improvement room was left behind for a future re-iteration over this project
         * To add a rate to the favorites list just long press on it! The same for removing! (I do have a small visual bug because of the size of the list the API respond back, in the future we need to load/unload the list along with the scroll of the scrollView to keep the animation smooth, since the app is resizing hundreds of cells all at once at the moment.)  

    *Architecture*

    * The app is build following the MVVM Architecture. Since it's considered one of the best architectures at the moment.
    * Design-wise the app aimed for a simple, yet modern look, trying to keep things simple but also elegant, without fuzz.
    * I've also used Geometry Reader in everything, so the UI is 100% compatible with IPadOs and MacOS, since it will always keep the original proportions.


      *Components:*
   
      *UI COMPONENTS*

        * HomePageView: The HomePageView can also be viewed has a main HUB, where i've aggregated all the other views to it. Keeping things simple and yet functional, aiming to have a good readability of the code. Other than that, the homeScreen does not have anything else special, it's rather simple by design.
  
        * CapsuleViewCell: The "heart" of the app, visually speaking, all the rates cells are displayed by re-using this cell component. Making it easier to maintain and improve/re-use in the future. The viewModel provided on the creation of the View is the controller of it all, you just have to pass all the config parameters to it and the cell will be self configured. The cell is made to fill all the available space.
                            So when using it, remember to set a frame for what you're using it for, the elements will auto-resize to fit the available space.
          
        * ChartViewCell: Similar to the CapsuleViewCell, the ChartViewCell works in the exactly same way, but being constructed by it's own ViewModel, the view configures it self to fit all the available space, so adding a frame to it it's very important! The element tends to change in size a bit.
                          But that's because we're adding only 2 points to the chart, which is not advised, for this MVP is enough to prove the concept but in the future this should be addressed.
  
        * FavouritesView: Similar to the HomePageView, the FavouritesView only aggregates two components together. The list of CapsuleViewCell and a Header Text. Technically speaking, it's nothing else than an aggregator view. By choosing the viewCells approach we don't need to give it much thought. Which is great for readability and maintainability of the codebase.
   
       *OFFLINE SYSTEM COMPONENTS:*
        
        * AppDefaults: The AppDefaults Class was made to aggregate all the logic for fetching and storing the API data. Since I've aimed for a MVP, the appDefauts approach was the clear choice since I did not wanted to over engineer this product to make sure I've delivered within the time frame. In a latter approach the best would be to update the code to use coreData instead of appDefaults, since they provide a better connection between the saved data and allowing us to save more than just the last fetch easily. So the charts data can be more accurate and useful.
          
        * APIService: Is the middle man for the talking with the API, all the HTTP request logic and JSON decoding is in there, to better place everything on it's own place.
                      The "API_KEY" is stored into the configuration file to be secured, we fetch it from the info.plist. Making possible to have two different keys, for different environment.

        * MockData: It's a file with some mock data that was used for development purpose, it's also still in use just has a fallback in case everything fails, we will still be able to display something for the user, keeping the app more responsive.


    *UNIT TESTING*

      * Two tests were added to the app, under 'ExchanjorTests', those being 'testFetchFromAPINotNilOrError' and 'testAppDefaultsNotLoadingMockData'. Both to ensure our API calls and appDefaults loads are not falling or going to fallback mock data respectively.
