use std::fmt::Display;

// Function types must be declared
fn print_arr<T: Display>(a: &[T]) -> () {
    for i in a {
        print!("{} ", i);
    }
    println!("");
}

fn swap(a: &mut[i32], i: usize, j: usize) -> () {
  let tmp = a[i];
  a[i] = a[j];
  a[j] = tmp;
}
fn find_second_largest (nums: &mut [i32]) -> i32{
  for i in 0..nums.len() {
    for j in i..nums.len() {
      if nums[i] < nums[j] {
        swap(&mut nums[..], i, j);
      }
    }
  }
	return nums[1];
}

fn zero_out_pos(nums: &mut[i32],position: usize){
	nums[position]=0;
}


fn main() {
    let mut nums = [9, 4, 22, 13, 11, 44, 8, 12, 1];
    print_arr(&nums[..]);

		/* Add the appropriate function call to find_second_largest here */
    let second = find_second_largest(&mut nums); 
    println!("The second largest elem in the array was {}", second);

    // ... /* Add a function call to zero_out_pos, which should set a[5] to 0. */
    zero_out_pos(&mut nums,5);
    
    print_arr(&nums[..]);

		/* Add the appropriate function call to find_second_largest here */
    let second2 = find_second_largest(&mut nums); 
    println!("The second largest elem in the array was {}", second2);
}























