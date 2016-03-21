use std::io;

pub fn store_event(name: String, details: Vec<String>) -> io::Result<()> {
    println!("Saving {} and with details count {}", name, details.len());
    Ok(())
}
