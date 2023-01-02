import UIKit

let arrayOfBlogCategories: [String] = ["Swift", "Debugging", "Xcode", "Workflow", "Optimization"]
var setOfBlogCategories: Set<String> = ["Swift", "Debugging", "Xcode", "Workflow", "Optimization"]


var (inserted, memberAfterInsert) = setOfBlogCategories.insert("Swift")
if !inserted {
    print("\(memberAfterInsert) already exists")
}


