package com.pig.demohello;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RestfulController {

	
	@GetMapping("hellopig")
	public String check() {
		return "Hello Pog!";
	}
	
	@GetMapping("hellopig2")
	public String check2() {
		return "Hello Pog2!";
	}
	
	@GetMapping("hellopig3")
	public String check3() {
		return "Hello Pog3!";
	}
}
