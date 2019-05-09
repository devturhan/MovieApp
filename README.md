# MovieApp
Sample Movie App with Unit and Integration Tests

## Features
- Bookmarking
- Grid, List layout change
- MovieList and MovieDetail 
- Loading new movies when scrolled to bottom 

## Application Detail
- As a Architecture MVVM preferred,
- Implemented Data Providers along with Protocols to be able to Mock Services (For Unit Testing)
- Used SDWebImage to load images directly to UIImageView from Url
- Used Alamofire for networking calls on service layer
- Libraries encapsulated and isolated from main layers (flexible to change)
- Each tableView&collectionView own adapter which conforms delegate and datasource
- Configured to provide all data from service layer 
- Used state design pattern for layout change
- Protocol Oriented

## Testing 
- Implemented Unit and Integration Tests 
- Used SwiftyMocky
