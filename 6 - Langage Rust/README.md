# Apprendre le langage rust 

## Lien utile :

Docuement Rust en Francais :
-   [Rust book FR](https://jimskapt.github.io/rust-book-fr/)
-   [Avis et plus ](https://virtualabs.fr/)

## un repo est consacré à Rust :

[Learn Rust](https://github.com/BlockchainSpot/LearnRust)

## Bon à savoir :

Compilateur Cargo : 

Installation de Cargo : [CargoInstall](https://doc.rust-lang.org/cargo/getting-started/installation.html)


``curl https://sh.rustup.rs -sSf | sh
``


### Types : 

Variables hold primitive data or references to data
Variables are immutable by default
rust is a block-scoped language

```rust
pub fn run() {
    let name = "Karl";

    let mut age = 37;
    println!("My name is {} and I am {}", name, age);
    age = 38;
    println!("My name is {} and I am {}", name, age);

    //Define constant
    const ID: i32 = 001;
    println!("ID: {}", ID);

    // Asign multpple vars
    let (my_name, my_age) = ("Karl", 37);
    println!("{} is {}", my_name, my_age);
}
```

### Variable :

Primitive Types ->
Intergers: u8, i8, u16, i16, u32, i32, u64, i64, u128, i128, (number of bits they take in memory)
floasts: f32, f64
Boolean (bool)
Tuples
Arrays 

Rust is a stativallyu typed language, witch means that it must know the types of all variables ot compile time, however, the compiler can usually infer what type we want to use based on the value and how we use it.


*   mains.rs

```rust
mod print;
mod vars;

fn main() {
    print::run(); 
}

````

*   print.rs

```rust

pub fn run() {

    // print to console
    println!("Hello, world");

    println!("{} id from {}", "Brad", "Mass");

    //positional Arguments
    println!("{0} is from {1} and {2} ", "Brad","Mass", "code");

    //Named Arguments
    println!("{name} Likes to play {activity}", name = "Jhon", activity = "baseball");

    // Placeholder traits
    println!("Binary: {:b} Hex: {:x} Octal: {:o}", 10, 10, 10);

    //placeholder for debug trait
    println!("{:?}", (12, true, "hello"));

    //Basic match
    println!("10 + 10 = {}", 10 + 10);

}
```


### String :

*   strings.rs

```rust 
// Primiive str = Immutable fixed-lenght string somewhere in memory
// String = Growable, hea^p-allocated data structure - use when you need to modify or own string data 

pub fn run() {

    let mut hello = String::from("Hello");

    // Get lenght
    println!("Length: {}", hello.len());

    // Push char
    hello.push('W');

    // Push string
    hello.push_str("orld!");

    // Capacity in bytes
    println!("Capacity: {}", hello.capacity());

    // Check if empty
    println!(" Is Empty: {}", hello.is_empty());

    //Contains
    println!("Contains 'World' {}",hello.contains("World "));

    //Replace 
    println!("Replace: {}", hello.replace("World ", "There"));

    // Loop through string by whitespace :
    for word in hello.split_whitespace() {
        println!("{}", word);
    }

    println!("{}", hello);

}
```

### Tuples :

*   tuples.rs

```rust 
// Tuples groupe together valeus of different types
// Max 12 elements


pub fn run(){
    let person: (&str, &str, i8) = ("Brad","Mass", 37);

    println!("{} is from {} and is {}", person.0, person.1, person.2);

```



