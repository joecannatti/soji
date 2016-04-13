extern crate chrono;
use self::chrono::*;

use std::io;
use std::fs;
use std::fs::OpenOptions;
use std::io::Write;
use std::io::BufReader;
use std::io::BufRead;

pub fn store_event(name: String, details: Vec<String>) -> io::Result<()> {
    let now: DateTime<Local> = Local::now();
    let mut f = OpenOptions::new()
                .read(true)
                .write(true)
                .create(true)
                .append(true)
                .open("/tmp/.soji_data.csv")
                .expect("couldn't open data file");
    let mut row_data = details.to_vec();
    row_data.insert(0, name);
    row_data.push(now.format("%Y-%m-%d %H:%M:%S %z").to_string());
    let row_string = row_data.join(",");
    try!(f.write_all(row_string.as_bytes()));
    try!(f.write_all("\n".as_bytes()));
    Ok(())
}

pub fn current_task() -> Result<String, String>{
    let f = match fs::File::open("/tmp/.soji_data.csv") {
        Err(_) => return Ok("".to_string()),
        Ok(file) => file
    };
    let f = BufReader::new(f);
    let mut status : String = "".to_string();
    for line in f.lines() {
        let line_copy = line.unwrap();
        if &line_copy[..5] == "start" {
            let mut components = line_copy.split(",");
            let _ = components.nth(0);
            let event_name = components.nth(0).expect("start event expected to have task name").to_string();
            let start_time = components.nth(0).expect("start event expected to have start time").to_string();
            status = format!("{} -- {:?} min", event_name, ((Local::now().timestamp() - chrono::datetime::DateTime::parse_from_str(&start_time, "%Y-%m-%d %H:%M:%S %z").expect("date not found").timestamp()) / 60));
        }
    }
    Ok(status)
}
