// 1-ი თასქი ბიბლიოთეკის სიმულაცია. (თავისი ქვეთასქებით).

// 1.1. შევქმნათ Class Book. Properties: bookID(უნიკალური იდენტიფიკატორი Int), String title, String author, Bool isBorrowed. Designated Init. Method რომელიც ნიშნავს წიგნს როგორც borrowed-ს. Method რომელიც ნიშნავს წიგნს როგორც დაბრუნებულს.

class Book {
    var bookID: Int
    var title: String
    var author: String
    var isBorrowed: Bool
    
    init(bookID: Int, title: String, author: String, isBorrowed: Bool) {
        self.bookID = bookID
        self.title = title
        self.author = author
        self.isBorrowed = isBorrowed
    }
    
    func bookBorrowed(book: Book) {
        book.isBorrowed = true
    }
    
    func bookReturned(book: Book) {
        book.isBorrowed = false
    }
}

// 1.2. შევქმნათ Class Owner. Properties: ownerId(უნიკალური იდენტიფიკატორი Int), String name, Books Array სახელით borrowedBooks. Designated Init. Method რომელიც აძლევს უფლებას რომ აიღოს წიგნი ბიბლიოთეკიდან. Method რომელიც აძლევს უფლებას რომ დააბრუნოს წაღებული წიგნი.

class Owner {
    var ownerId: Int
    var name: String
    var borrowedBooks: [Book]
    
    
    init(ownerId: Int, name: String, borrowedBooks: [Book]) {
        self.ownerId = ownerId
        self.name = name
        self.borrowedBooks = borrowedBooks
    }
    
    func borrowBook(book: Book) {
        borrowedBooks.append(book)
        book.bookBorrowed(book: book)
    }
    
    func returnBook(book: Book) {
        let newArray = borrowedBooks.filter() { $0.bookID != book.bookID }
        borrowedBooks = newArray
        book.bookReturned(book: book)
    }
    
}

// 1.3. 3. შევქმნათ Class Library Properties: Books Array, Owners Array. Designated Init. Method წიგნის დამატება, რათა ჩვენი ბიბლიოთეკა შევავსოთ წიგნებით. Method რომელიც ბიბლიოთეკაში ამატებს Owner-ს. Method რომელიც პოულობს და აბრუნებს ყველა ხელმისაწვდომ წიგნს. Method რომელიც პოულობს და აბრუნებს ყველა წაღებულ წიგნს. Method რომელიც ეძებს Owner-ს თავისი აიდით თუ ეგეთი არსებობს. Method რომელიც ეძებს წაღებულ წიგნებს კონკრეტული Owner-ის მიერ. Method რომელიც აძლევს უფლებას Owner-ს წააღებინოს წიგნი თუ ის თავისუფალია.

class Library {
    var arrayOfBooks: [Book]
    var arrayOfOwners: [Owner]
    
    init(arrayOfBooks: [Book], arrayOfOwners: [Owner]) {
        self.arrayOfBooks = arrayOfBooks
        self.arrayOfOwners = arrayOfOwners
    }
    
    func addBookToLibrary(book: Book) {
            arrayOfBooks.append(book)
    }
    
    func addOwnerToLibrary(owner: Owner) {
        arrayOfOwners.append(owner)
    }
    
    func availableBooks() -> Array<Book> {
        return  arrayOfBooks.filter() { !$0.isBorrowed }
    }
    
    func unavailableBooks() -> Array<Book> {
        return arrayOfBooks.filter() { $0.isBorrowed }
    }
    
    func ownerExists(ownerID: Int) {
        if arrayOfOwners.filter({ $0.ownerId == ownerID }).isEmpty {
            print("მფლობელი ID-ით '\(ownerID)' არ არსებობს.")
        } else {
            print("მფლობელი ID-ით '\(ownerID)' არსებობს.")
        }
    }
    
    func booksBorrowedByOwner(owner: Owner) -> Array<Book> {
        return owner.borrowedBooks
    }
    
    func borrowABook(bookToBorrow: Book, ownerBorrower: Owner) {
        if !bookToBorrow.isBorrowed {
            ownerBorrower.borrowBook(book: bookToBorrow)
        } else {
            print("წიგნს ვერ გაიტანთ რადგან უკვე წაღებულია სხვა owner-ის მიერ.")
        }
    }
    
}

// 4. გავაკეთოთ ბიბლიოთეკის სიმულაცია. შევქმნათ რამოდენიმე წიგნი და რამოდენიმე Owner-ი, შევქმნათ ბიბლიოთეკა. დავამატოთ წიგნები და Owner-ები ბიბლიოთეკაში წავაღებინოთ Owner-ებს წიგნები და დავაბრუნებინოთ რაღაც ნაწილი. დავბეჭდოთ ინფორმაცია ბიბლიოთეკიდან წაღებულ წიგნებზე, ხელმისაწვდომ წიგნებზე და გამოვიტანოთ წაღებული წიგნები კონკრეტულად ერთი Owner-ის მიერ.

// შევქმნათ რამდენიმე წიგნი
var book1 = Book(bookID: 001, title: "Fire & Blood", author: "George R. R. Martin", isBorrowed: false)
var book2 = Book(bookID: 002, title: "The Hunger Games", author: "Suzanne Collins", isBorrowed: false)
var book3 = Book(bookID: 003, title: "The Fellowship of the Ring", author: "J. R. R. Tolkien", isBorrowed: false)
var book4 = Book(bookID: 004, title: "Dune", author: "Frank Herbert", isBorrowed: false)
var book5 = Book(bookID: 005, title: "The Eye of the World", author: "Robert Jordan", isBorrowed: false)
var book6 = Book(bookID: 006, title: "The Lion, the Witch and the Wardrobe", author: "C. S. Lewis", isBorrowed: false)
var book7 = Book(bookID: 007, title: "The Witcher", author: "Andrzej Sapkowski", isBorrowed: false)

// შევქმნათ რამდენიმე owner
var owner1 = Owner(ownerId: 001, name: "Bob", borrowedBooks: [])
var owner2 = Owner(ownerId: 002, name: "Mary", borrowedBooks: [])

// შევქმნათ ბიბლიოთეკა
var library1 = Library(arrayOfBooks: [], arrayOfOwners: [])

// დავამატოთ წიგნები
library1.addBookToLibrary(book: book1)
library1.addBookToLibrary(book: book2)
library1.addBookToLibrary(book: book3)
library1.addBookToLibrary(book: book4)
library1.addBookToLibrary(book: book5)
library1.addBookToLibrary(book: book6)
library1.addBookToLibrary(book: book7)

// დავამატოთ ownerები
library1.addOwnerToLibrary(owner: owner1)
library1.addOwnerToLibrary(owner: owner2)

// წავაღებინოთ ownerებს წიგნი
owner1.borrowBook(book: book1)
owner1.borrowBook(book: book2)
owner1.borrowBook(book: book3)
owner2.borrowBook(book: book4)
owner2.borrowBook(book: book5)
owner2.borrowBook(book: book6)

// დავაბრუნებინოთ ownerებს წიგნი
owner1.returnBook(book: book1)
owner2.returnBook(book: book6)

// დავბეჭდოთ ინფო ბიბლიოთეკიდან წაღებულ წიგნებზე
print("ბიბლიოთეკიდან წაღებულია შემდეგი წიგნები: \(library1.unavailableBooks().map( { $0.title } ))")

// დავბეჭდოთ ინფო ხელმისაწვდომ წიგნებზე
print("ბიბლიოთეკაში ხელმისაწვდომია შემდეგი წიგნები: \(library1.availableBooks().map( { $0.title } ))")

// გამოვიტანოთ წაღებული წიგნები კონკრეტულად ერთი Owner-ის მიერ.
print("მითითებული owner-ის მიერ წაღებულია შემდეგი წიგნები: \(library1.booksBorrowedByOwner(owner: owner1).map( { $0.title } ))")
print("მითითებული owner-ის მიერ წაღებულია შემდეგი წიგნები: \(library1.booksBorrowedByOwner(owner: owner2).map( { $0.title } ))")

// არსებობს თუ არა owner მითითებული id-ით (მოთხოვნებში არ ეწერა მარა მაინც ვამოწმებ :) )
library1.ownerExists(ownerID: 001)
library1.ownerExists(ownerID: 003)

print("")






// 2 თასქი ავაწყოთ პატარა E-commerce სისტემა. (თავისი ქვეთასქებით).

// 2.1.შევქმნათ Class Product, შევქმნათ შემდეგი properties productID (უნიკალური იდენტიფიკატორი Int), String name, Double price. შევქმნათ Designated Init.

class Product {
    var productID: Int
    var name: String
    var price: Double
    
    init(productID: Int, name: String, price: Double) {
        self.productID = productID
        self.name = name
        self.price = price
    }
}

// 2.2. 2. შევქმნათ Class Cart Properties: cartID(უნიკალური იდენტიფიკატორი Int), Product-ების Array სახელად items. შევქმნათ Designated Init. Method იმისათვის რომ ჩვენს კალათაში დავამატოთ პროდუქტი. Method იმისათვის რომ ჩვენი კალათიდან წავშალოთ პროდუქტი მისი აიდით. Method რომელიც დაგვითვლის ფასს ყველა იმ არსებული პროდუქტის რომელიც ჩვენს კალათაშია.

class Cart {
    var cartID: Int
    var items: [Product]
    
    init(cartID: Int, items: [Product]) {
        self.cartID = cartID
        self.items = items
    }
    
    func addProduct(product: Product) {
        items.append(product)
    }
    
    func removeProduct(prodID: Int) {
        items.filter() { $0.productID != prodID }
    }
    
    func calculatedPrice() -> Double {
        var finalPrice: Double = 0
        for product in items {
            finalPrice += product.price
        }
        return finalPrice
    }
}

// 2.3. შევქმნათ Class User Properties: userID(უნიკალური იდენტიფიკატორი Int), String username, Cart cart. Designated Init. Method რომელიც კალათაში ამატებს პროდუქტს. Method რომელიც კალათიდან უშლის პროდუქტს. Method რომელიც checkout (გადახდის)  იმიტაციას გააკეთებს დაგვითვლის თანხას და გაასუფთავებს ჩვენს shopping cart-ს.

class User {
    var userID: Int
    var username: String
    var cart: Cart
    
    init(userID: Int, username: String, cart: Cart) {
        self.userID = userID
        self.username = username
        self.cart = cart
    }
    
    func addProductToCart(cart: Cart, product: Product) {
        cart.addProduct(product: product)
    }
    
    func removeProductFromCart(cart: Cart, product: Product) {
        cart.items.filter() { $0.productID != product.productID }
    }
    
    func checkout() {
        print("მომხმარებელ '\(username)'-ს გადასახდელი აქვს: \(cart.calculatedPrice()) ლარი.")
        cart.items.removeAll()
    }
    
}

// 2.4. გავაკეთოთ იმიტაცია და ვამუშაოთ ჩვენი ობიექტები ერთად. შევქმნათ რამოდენიმე პროდუქტი. შევქმნათ 2 user-ი, თავისი კალათებით, დავუმატოთ ამ იუზერებს კალათებში სხვადასხვა პროდუქტები, დავბეჭდოთ price ყველა item-ის ამ იუზერების კალათიდან. და ბოლოს გავაკეთოთ სიმულაცია ჩექაუთის, დავაბეჭდინოთ იუზერების გადასხდელი თანხა და გავუსუფთაოთ კალათები.

// შევქმნათ რამდენიმე პროდუქტი
var product1 = Product(productID: 001, name: "პური", price: 1.10)
var product2 = Product(productID: 002, name: "კვერცხი 10ც", price: 5.50)
var product3 = Product(productID: 003, name: "კარაქი", price: 6.70)
var product4 = Product(productID: 004, name: "ზეთი 1ლ", price: 4.30)
var product5 = Product(productID: 005, name: "შაქარი 1კგ", price: 2.60)
var product6 = Product(productID: 006, name: "ყავა 100გ", price: 7.25)

// შევქმნათ 2 კალათა
var cart1 = Cart(cartID: 001, items: [])
var cart2 = Cart(cartID: 002, items: [])

// შევქმნათ 2 user
var user1 = User(userID: 001, username: "Bob", cart: cart1)
var user2 = User(userID: 002, username: "Mary", cart: cart2)

// დავუმატოთ ამ იუზერებს კალათებში სხვადასხვა პროდუქტები
user1.cart.addProduct(product: product1)
user1.cart.addProduct(product: product3)
user1.cart.addProduct(product: product5)

user2.cart.addProduct(product: product2)
user2.cart.addProduct(product: product4)
user2.cart.addProduct(product: product6)

// დავბეჭდოთ price ყველა item-ის ამ იუზერების კალათიდან
print("\(user1.username)-ის კალათაში განთავსებული პროდუქტების ფასებია: ", terminator: "")
for product in user1.cart.items {
    print("\(product.name) - \(product.price) ლარი", terminator: "; ")
}
print("")

print("\(user2.username)-ის კალათაში განთავსებული პროდუქტების ფასებია: ", terminator: "")
for product in user2.cart.items {
    print("\(product.name) - \(product.price) ლარი", terminator: "; ")
}
print("")

// გავაკეთოთ სიმულაცია ჩექაუთის, დავაბეჭდინოთ იუზერების გადასხდელი თანხა და გავუსუფთაოთ კალათები
user1.checkout()
user2.checkout()

// ვამოწმებ რომ განულდა
print("\(user1.cart.calculatedPrice())")
print("\(user2.cart.calculatedPrice())")

print("")



// დამატებითი task

// 1. Class-ი სახელით Animal, with properties: name, species, age. ამ class აქვს: Designated init ამ properties ინიციალიზაციისთვის. Method makeSound() რომელიც დაგვი-print-ავს ცხოველის ხმას.

class Animal {
    var name: String
    var species: String
    var age: Int
    
    init(name: String, species: String, age: Int) {
        self.name = name
        self.species = species
        self.age = age
    }
    
    required init() { // 8.
        fatalError("Animal class არის აბსტრაქტული და არ უნდა იყოს მისი შექმნა პირდაპირ შესაძლებელი.")
    }
    
    func makeSound() {
        print("animal 🔊")
    }
}

// 2. Animal-ის child class სახელად Mammal (ძუძუმწოვრები) დამატებითი String property -> furColor. Override method makeSound() სადაც აღწერთ შესაბამის ხმას. Init-ი -> სახელით, ასაკით, ბეწვის ფერით. convenience init -> სახელით, ბეწვის ფერით.

class Mammal: Animal {
    var furColor: String
    
    init(furColor: String, name: String, age: Int) {
        self.furColor = furColor
        super.init(name: name, species: "Mammal", age: age)
    }
    
    convenience init(name: String, furColor: String) {
        self.init(furColor: furColor, name: name, age: 0)
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
    override func makeSound() {
        print("mammal 🔊")
    }
    
}

// 3. Animal-ის child class: Bird. დამატებითი Bool property: canFly. Override method makeSound() სადაც ავღწერ შესაბამის ხმას. Init -> სახელით, ასაკით, შეუძლია თუ არა ფრენა. convenience init -> სახელით, შეუძლია თუ არა ფრენა.

class Bird: Animal {
    var canFly: Bool
    
    init(name: String, age: Int, canFly: Bool) {
        self.canFly = canFly
        super.init(name: name, species: "Bird", age: age)
    }
    
    convenience init(name: String, canFly: Bool) {
        self.init(name: name, age: 0, canFly: canFly)
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
    override func makeSound() {
        print("bird 🔊")
    }
    
}

// 4. Animal-ის child class: Reptile. დამატებითი Bool property: isColdBlooded. Override method makeSound() სადაც ავღწერ შესაბამის ხმას. Failable Init თუ რეპტილიას ასაკი ნაკლებია 0-ზე ვაბრუნებთ nil-ს.

class Reptile: Animal {
    var isColdBlooded: Bool
    
    init?(age: Int, name: String, isColdBlooded: Bool) {
        if age < 0 {
            return nil
        }
        self.isColdBlooded  = isColdBlooded
        super.init(name: name, species: "Reptile", age: age)
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
    override func makeSound() {
        print("reptile 🔊")
    }
    
}

// 5. Mammal-ის child class: Lion. დამატებით String property: maneColor. Override მეთოდი makeSound() სადაც ავღწერ შესაბამის ხმას.

class Lion: Mammal {
    var maneColor: String
    
    init(maneColor: String, name: String, age: Int) {
        self.maneColor = maneColor
        super.init(furColor: maneColor, name: name, age: age)
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
    override func makeSound() {
        print("lion 🔊")
    }
    
}

// 6. Bird-ის child class: Eagle. დამატებით Double property: wingspan. Override მეთოდი makeSound() სადაც ავღწერ შესაბამის ხმას.

class Eagle: Bird {
    var wingspan: Double
    
    init(wingspan: Double, age: Int, name: String, canFly: Bool) {
        self.wingspan = wingspan
        self.wingspan = wingspan
        super.init(name: name, age: age, canFly: canFly)
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
    override func makeSound() {
        print("eagle 🔊")
    }
    
}

// 7. Reptile-ის child class: Snake. დამატებით Double property: length. Override მეთოდი makeSound() სადაც ავღწერ შესაბამის ხმას.

class Snake: Reptile {
    var length: Double
    
    init(length: Double, age: Int, name: String, isColdBlooded: Bool) {
        self.length = length
        super.init(age: age, name: name, isColdBlooded: isColdBlooded)!
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
    override func makeSound() {
        print("snake 🔊")
    }
    
}

// 9. შევქმნათ ზოოპარკის ცხოველების Array, დავამატოთ მასში სხვადასხვა სახის ცხოველები: 2-2 Mammal, Bird, Reptile ასევე შევქმნათ 1-1 Lion, Eagle, Snake.

var zooArray: [Animal] = []

zooArray.append(Mammal(name: "mammal 1", furColor: "black"))
zooArray.append(Mammal(furColor: "white", name: "mammal 2", age: 5))
zooArray.append(Bird(name: "bird 1", canFly: true))
zooArray.append(Bird(name: "bird 2", age: 2, canFly: false))
zooArray.append(Reptile(age: 1, name: "reptile 1", isColdBlooded: true)!)
zooArray.append(Reptile(age: 3, name: "reptile 2", isColdBlooded: false)!)
zooArray.append(Lion(maneColor: "Amber", name: "lion 1", age: 7))
zooArray.append(Eagle(wingspan: 15, age: 4, name: "eagle 1", canFly: true))
zooArray.append(Snake(length: 30, age: 3, name: "snake 1", isColdBlooded: true))

// 10. დავბეჭდოთ ჩვენი Array-იდან, ყველა ცხოველის სახელი, სახეობა, ასაკი, და ასე გამოვიძახოთ makeSound მეთოდი.

for animal in zooArray {
    print("The animal is a(n) \(animal.species) named \(animal.name). It is \(animal.age) years old. It sounds like: ", terminator: "")
    animal.makeSound()
}
