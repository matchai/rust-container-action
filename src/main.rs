use std::env;

fn main() {
    let my_input = env::var("INPUT_MYINPUT").unwrap_or_default();
    let output = format!("Hello {}", my_input);

    println!("::set-output name=myOutput::{}", output);
}
