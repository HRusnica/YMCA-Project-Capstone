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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.dao.InstructorDAO;
import com.techelevator.dao.StudentDAO;
import com.techelevator.dao.SwimClassDAO;
import com.techelevator.model.Instructor;
import com.techelevator.model.ScheduledClass;
import com.techelevator.model.Skill;
import com.techelevator.model.Student;
import com.techelevator.model.SwimClass;

@Controller
public class InstructorController {
	
	@Autowired
	private InstructorDAO instructorDao;
	
	@Autowired
	private StudentDAO studentDao;
	
	@Autowired
	private SwimClassDAO swimClassDao;
	
	
	@RequestMapping(path="/instructorDashboard", method=RequestMethod.GET)
	public String getInstructorHomePage(ModelMap modelHolder,ModelMap model, HttpSession session, HttpServletRequest request) {
		HttpSession mySession = request.getSession();
		List<ScheduledClass> classes = instructorDao.GetAllScheduledClassesByInstructor(((Instructor) session.getAttribute("instructor")).getInstructorId());
		modelHolder.put("allScheduledClasses", classes);
		
		List<Student> students = studentDao.getAllStudentsByInstructor(((Instructor) session.getAttribute("instructor")).getInstructorId());
		model.put("studentClassList", students);
		
		return "instructorDashboard";
	}
	@RequestMapping(path="/instructorViewClasses", method=RequestMethod.GET)
	public String getInstructorViewClasses(ModelMap modelHolder, HttpSession session, HttpServletRequest request) {
		HttpSession mySession = request.getSession();
		List<ScheduledClass> classes = instructorDao.GetAllScheduledClassesByInstructor(((Instructor) session.getAttribute("instructor")).getInstructorId());
		modelHolder.put("allScheduledClasses", classes);
		return "instructorViewClasses";
	}
	
	@RequestMapping(path="/skillsIntroduced/{classId}", method=RequestMethod.GET)
	public String showSkills(ModelMap modelHolder, HttpSession session, HttpServletRequest request, @PathVariable int classId) {
		List<Skill> skillList = swimClassDao.getSkillsByClassId(classId);
		modelHolder.addAttribute("skillList", skillList);
		return "skillsIntroduced";
	}
	
	@RequestMapping(path="/spreadsheet/{classId}", method=RequestMethod.GET)
	public String showSpreadsheet(ModelMap modelHolder, HttpSession session, HttpServletRequest request, @PathVariable int classId) {
//		
//		List<SwimClass> swimClasses = swimClassDao.getAllClasses();
//		System.out.println(swimClasses.get(0).getLevelName());
//
//		
//		for(SwimClass swimClass : swimClasses) {
//			if (classId == (swimClass.getClassId())) {
//				modelHolder.put("swimClass", swimClass);
//				System.out.println(swimClass.getLevelName());
//			} else {
//				System.out.println("fail");
//			}
//		}
//		
		System.out.println(classId);
		modelHolder.put("swimClass", swimClassDao.getClassByClassId(classId));
		
		
		
		
		List<Student> students = studentDao.getAllStudentsByClass(((Instructor) session.getAttribute("instructor")).getInstructorId());
		modelHolder.put("allStudents", students);
		
		//List<ScheduledClass> classes = instructorDao.GetAllScheduledClassesByInstructor(((Instructor) session.getAttribute("instructor")).getInstructorId());
		//model.put("allScheduledClasses", classes);
		
		return "spreadsheet";
	}
	
	
//	@RequestMapping(path="/addStudent", method=RequestMethod.POST)
//	public String addInstructor(@Valid @ModelAttribute Student student, BindingResult result, RedirectAttributes flash){
//		flash.addFlashAttribute("student", student);
//
//		instructorDao.addStudent(student);
//		return "redirect:/managerHome";
//}

}
