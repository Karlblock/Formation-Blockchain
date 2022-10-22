use std::env;

pub fn run() {
    let args: Vec<String> = env::args().collect();
    let command = args[1].clone();
    let name = "Karl";

    // println!("Args: {:?}",args);

    if command == "hello" {
        println!("Hello {}, how are you", name);
    }
}