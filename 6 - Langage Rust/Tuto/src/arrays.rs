// Arrays - Fixed list where elements are the same data types


pub fn run() {
    let mut numbers: [i32; 5] = [1, 2, 3, 4, 5];

    //Re-assign value
    numbers[2] = 20;

    println!("{:?}", numbers);

    // Get single val
    println!("Single Value: {}", numbers[0]);
}