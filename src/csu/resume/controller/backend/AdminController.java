package csu.resume.controller.backend;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import csu.resume.entity.Adminuser;
import csu.resume.service.IAdminUserService;

@RequestMapping("/master")
@Controller
public class AdminController {
	
	@Autowired
	public IAdminUserService adminUserService;
	
	
	
	@RequestMapping("/login")
	public String login(){
		
		return "backend/jsp/adminlogin";
	}
	@RequestMapping("/dologin")
	@ResponseBody
	public String dologin(HttpServletRequest request,String username,String passwd){
		
		if(username==null||passwd==null){
			return "error";
		}
		Adminuser user=adminUserService.searchUserByName(username);
		if(user==null){
			return "1";
		}else{
			request.getSession().setAttribute("admin", user);
			return "0";
		}	
		
	}
	@RequestMapping("/doAdd")
	@ResponseBody
	public String doAdd(HttpServletRequest request,String username,String passwd){
		
		if(username==null||passwd==null){
			return "error";
		}
		Adminuser isExituser=adminUserService.searchUserByName(username);
		if(isExituser==null){
			Adminuser user=new Adminuser();
			user.setAdminuserName(username.trim());
			user.setAdminuserPwd(passwd.trim());
			if(adminUserService.addUser(user))
				return "0";
			else
				return "1";
			
		}else{
			return "1";
		}	
		
	}
	@RequestMapping("/doUpdate")
	@ResponseBody
	public String doUpdate(HttpServletRequest request,Adminuser user){
		
		if(user==null){
			return "error";
		}
			if(adminUserService.updateUser(user))
				return "0";
			else
				return "1";
			
		
	}
	@RequestMapping("/delUser")
	public String doDel(HttpServletRequest request,String id){
		
		Adminuser isExituser=adminUserService.searchUserById(Integer.parseInt(id));
		if(isExituser!=null){
			if(adminUserService.delUser(isExituser))
				return "redirect:/master/adminMaster";			
		}
		return "redirect:/master/adminMaster";
	}
	
	@RequestMapping("/index")
	public ModelAndView index(HttpServletRequest request){
			
			Object o=request.getSession().getAttribute("admin");
			ModelAndView model=new ModelAndView();
			if(o==null){
				model.setViewName("backend/jsp/adminlogin");
			}else{
				model.setViewName("backend/jsp/adminindex");
				model.addObject("admin", (Adminuser)o);
			}
			//model.addObject("pages", page);
			return model;
		}
	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest request){
			
			Object o=request.getSession().getAttribute("admin");
			ModelAndView model=new ModelAndView();
			if(o==null){
				model.setViewName("backend/jsp/adminlogin");
			}else{
				request.getSession().removeAttribute("admin");
				model.setViewName("backend/jsp/adminlogin");
			}
			//model.addObject("pages", page);
			return model;
		}
	@RequestMapping("/adminMaster")
	public ModelAndView adminMaster(HttpServletRequest request){
			
			Object o=request.getSession().getAttribute("admin");
			List<Adminuser> list=adminUserService.getAllUser();
			ModelAndView model=new ModelAndView();
			if(o==null){
				model.setViewName("backend/jsp/adminlogin");
			}else{
				model.setViewName("backend/jsp/adminmaster");
				model.addObject("admin", (Adminuser)o);
				model.addObject("userlist",list);
			}
			//model.addObject("pages", page);
			return model;
		}
	@RequestMapping("/adduser")
	public ModelAndView adduser(HttpServletRequest request){
			
			Object o=request.getSession().getAttribute("admin");
			ModelAndView model=new ModelAndView();
			if(o==null){
				model.setViewName("backend/jsp/adminlogin");
			}else{
				model.setViewName("backend/jsp/adminadd");
				
				model.addObject("admin", (Adminuser)o);
			}
			//model.addObject("pages", page);
			return model;
		}
	@RequestMapping("/editUser")
	public ModelAndView editUser(HttpServletRequest request,String id){
			
			Object o=request.getSession().getAttribute("admin");
			ModelAndView model=new ModelAndView();
			Adminuser user= adminUserService.searchUserById(Integer.parseInt(id));
			if(o==null){
				model.setViewName("backend/jsp/adminlogin");
			}else{
				model.setViewName("backend/jsp/adminedit");
				
				model.addObject("admin", (Adminuser)o);
				model.addObject("user", user);
			}
			//model.addObject("pages", page);
			return model;
		}
}
