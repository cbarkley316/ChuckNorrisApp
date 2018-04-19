# Chuck Norris App

The Chuck Norris App for iOS uses the API from ICNDB.com to pull random Chuck Norris jokes from the website and display them. 

The ViewController creates an instance of my Network Manager class which handles the incoming data. It does so by utilizing the NSURLSession  sharedSession and a data task - completion handler combo. Once the data is retrieved it converts the JSON file into a dictionary via NSJSONSerialization. The new dictionary runs through a “for loop” which stores each joke in an array. NetworkManager then sends the array back to the ViewController and tells it’s tableView to reloadData. In the ViewController, the tableView’s row count is determined by the number of jokes in the array. Each row’s height is automatically adjusted to fit the joke’s length via UITableViewAutomaticDimension. The tableView then creates reusable cells, each an instance of my SpaceCell class. This class simply has a UILabel to hold the joke.

Then the “More” button does it all again.
