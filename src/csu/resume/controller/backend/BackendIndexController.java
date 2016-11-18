package csu.resume.controller.backend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BackendIndexController {
	@RequestMapping("/admin")
	public String index(){
		return "index";
	}
}
