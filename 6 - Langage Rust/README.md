# Apprendre le langage rust 

### Lien utile :

Docuement Rust en Francais :
-   [Rust book FR](https://jimskapt.github.io/rust-book-fr/)
-   [Avis et plus ](https://virtualabs.fr/)

## un repo est consacré à Rust :

[Learn Rust](https://github.com/BlockchainSpot/LearnRust)


### A savoir

Compilateur Cargo : 

Installation de Cargo : [CargoInstall](https://doc.rust-lang.org/cargo/getting-started/installation.html)


``curl https://sh.rustup.rs -sSf | sh
``


#### types 

// Variables hold primitive data or references to data
// Variables are immutable by default
// rust is a block-scoped language

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

#### Variable :

Primitive Types ->
Intergers: u8, i8, u16, i16, u32, i32, u64, i64, u128, i128, (number of bits they take in memory)
floasts: f32, f64
Boolean (bool)
Tuples
Arrays 

// Rust is a stativallyu typed language, witch means that it must know the types of all variables ot compile time, however, the compiler can usually infer what type we want to use based on the value and how we use it.


```
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

}
```


