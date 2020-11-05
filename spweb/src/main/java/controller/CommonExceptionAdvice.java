package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CommonExceptionAdvice {


	@RequestMapping(value ="/error500.do")
	public ModelAndView commonException() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("exception");
		mav.setViewName("error500");
		return mav;
	}
}
