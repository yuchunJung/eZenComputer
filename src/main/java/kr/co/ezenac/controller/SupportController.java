package kr.co.ezenac.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.ezenac.beans.SupportBean;
import kr.co.ezenac.service.SupportService;
import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/support")
@Log4j2
public class SupportController {

	@Autowired
	SupportService supportService;

	@GetMapping("/list")
	public String getSupportAll(Model model) {
		model.addAttribute("support", supportService.getSupportAll());
		return "user/support/support_list";
	}

	@GetMapping("/info")
	public String getSupport(Model model, int supportBean) {
		model.addAttribute("supportInfo", supportService.getSupport(supportBean));
		return "user/support/support_info";
	}

	@GetMapping("/write")
	public String write(HttpSession session, SupportBean supportBean, Model model) {
		model.addAttribute("supportUserId", supportBean.getSupportUserId());
		log.info("아이디=>{}", supportBean.getSupportUserId());
		return "user/support/support_write";
	}

//	@GetMapping("/search/{supportContent}")
//	public String search(Model model, @PathVariable("supportContent") String supportContent, SupportBean supportBean) {
//		model.addAttribute("searchSupport", supportService.searchSupport(supportBean));
//		return "user/support/support_list";
//	}

	@GetMapping("/modify")
	public String modify(Model model, SupportBean supportBean) {
		model.addAttribute("modify", supportService.editSupport(supportBean));
		return "user/support/support_info";
	}

	@GetMapping("/delete")
	public String delete(Model model, SupportBean supportBean) {
		model.addAttribute("delete", supportService.deleteSupport(supportBean));
		return "user/support/support_delete";
	}

	@PostMapping("/write_pro")
	public String writePro(@ModelAttribute("supportBean") SupportBean supportBean, Model model) {
		supportService.writeSupport(supportBean);
		return "user/support/write_success";
	}

}
