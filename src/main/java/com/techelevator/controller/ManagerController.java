package com.techelevator.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.dao.ManagerDAO;
import com.techelevator.dao.StudentDAO;
import com.techelevator.dao.SwimClassDAO;
import com.techelevator.model.Instructor;
import com.techelevator.model.Login;
import com.techelevator.model.Manager;
import com.techelevator.model.ScheduledClass;
import com.techelevator.model.Student;
import com.techelevator.model.SwimClass;


@Controller
public class ManagerController {
	
		@Autowired
		private ManagerDAO managerDao;
		
		@Autowired
		private SwimClassDAO classDao;
		
		@Autowired
		private StudentDAO studentDao;
		
		@RequestMapping(path="/managerHome", method=RequestMethod.GET)
			public String getManagerHome(ModelMap modelHolder){
			if(! modelHolder.containsAttribute("instructor")) {
				modelHolder.addAttribute("instructor", new Login());
			}
			return "managerHome";
		}
		
		@RequestMapping(path="/addInstructor", method=RequestMethod.POST)
			public String addInstructor(@Valid @ModelAttribute Instructor instructor, BindingResult result, RedirectAttributes flash){
				flash.addFlashAttribute("instructor", instructor);
//				if(result.hasErrors()){
//					flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "instructor", result);
//					return "redirect:/managerDashboard";
//				} 
				managerDao.saveInstructorEmail(instructor.getEmail());
				return "redirect:/managerDashboard";
		}
		@RequestMapping(path="/allClasses",method=RequestMethod.GET)
		public String showAllClassess(ModelMap modelHolder){	
			List<SwimClass> classes = classDao.getAllClasses();
			modelHolder.put("allClasses", classes);
			
			return "allClasses";		
		}
		
		@RequestMapping(path="/scheduleClass", method=RequestMethod.GET)
		public String showScheduleClass(ModelMap modelHolder){	
			List<SwimClass> classes = classDao.getAllClasses();
			modelHolder.put("allClasses", classes);
			modelHolder.put("allInstructors", managerDao.getAllInstructors());
			
			return "scheduleClass";	
		}
		

		@RequestMapping(path="/allInstructors", method=RequestMethod.GET)
		public String getAllInstructors(){
			
			return "allInstructors";
		}

		@RequestMapping(path="/managerDashboard", method=RequestMethod.GET)
		public String showManagerDashboard(ModelMap modelHolder, HttpSession session, HttpServletRequest request){
			List<ScheduledClass> classes = managerDao.GetAllScheduledClassesByManager(((Manager)session.getAttribute("manager")).getManagerId());
			modelHolder.put("allScheduledClassesByManager", classes);
			if(! modelHolder.containsAttribute("instructor")) {
				modelHolder.addAttribute("instructor", new Instructor());
			}
			if(! modelHolder.containsAttribute("student")) {
				modelHolder.addAttribute("student", new Student());
			}
			List<Student> allStudents = studentDao.getAllStudents();
			modelHolder.put("allStudents", allStudents);
			return "managerDashboard";
		}
		
		@RequestMapping(path="/report", method=RequestMethod.GET)
		public String showReportPage(ModelMap modelHolder, HttpSession session, HttpServletRequest request){
			List<ScheduledClass> classes = managerDao.GetAllScheduledClassesByManager(((Manager)session.getAttribute("manager")).getManagerId());
			modelHolder.put("allScheduledClassesByManager", classes);
			if(! modelHolder.containsAttribute("instructor")) {
				modelHolder.addAttribute("instructor", new Instructor());
			}
			if(! modelHolder.containsAttribute("student")) {
				modelHolder.addAttribute("student", new Student());
			}
			List<Student> allStudents = studentDao.getAllStudents();
			modelHolder.put("allStudents", allStudents);
			return "report";
		}
		
		@RequestMapping(path="/generateReport/{studentId}", method=RequestMethod.GET)
		public String generateReportPage(ModelMap modelHolder, HttpSession session, HttpServletRequest request){
			List<ScheduledClass> classes = managerDao.GetAllScheduledClassesByManager(((Manager)session.getAttribute("manager")).getManagerId());
			modelHolder.put("allScheduledClassesByManager", classes);
			if(! modelHolder.containsAttribute("instructor")) {
				modelHolder.addAttribute("instructor", new Instructor());
			}
			if(! modelHolder.containsAttribute("student")) {
				modelHolder.addAttribute("student", new Student());
			}
			List<Student> allStudents = studentDao.getAllStudents();
			modelHolder.put("allStudents", allStudents);
			return "generateReport";
		}
		
		
//		@RequestMapping(path="/addStudentToClass", method=RequestMethod.GET)
//		public String displayAllStudents(ModelMap modelHolder){
//			List<Student> allStudents = studentDao.getAllStudents();
//			modelHolder.put("allStudents", allStudents);
//			return "addStudentsToClass";
//		}
		
		@RequestMapping(path="/assignInstructorToClass", method=RequestMethod.GET)
		public String showAllClasses(ModelMap modelHolder){	
			List<SwimClass> classes = classDao.getAllClasses();
			modelHolder.put("allClasses", classes);
			
			return "assignInstructorToClass";	
		}
		
}

