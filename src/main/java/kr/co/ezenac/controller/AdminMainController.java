package kr.co.ezenac.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.ezenac.beans.AdminBean;
import kr.co.ezenac.beans.BoardInfoBean;
import kr.co.ezenac.beans.ContentBean;
import kr.co.ezenac.beans.ProductInfoBean;
import kr.co.ezenac.beans.SupportBean;
import kr.co.ezenac.beans.UserBean;
import kr.co.ezenac.service.AdminService;
import kr.co.ezenac.service.MainService;
import kr.co.ezenac.service.ProductListService;
import kr.co.ezenac.service.SupportService;

@Controller
@RequestMapping("/admin")
public class AdminMainController {
	@Autowired
	private MainService mainService;
	@Autowired
	private AdminService adminService;
	@Autowired
	private SupportService supportService;
	@Autowired
	private ProductListService productListService;

	@Resource(name = "loginAdminBean")
	private AdminBean loginAdminBean;

	/* * * * * * * * * * * * * main, login, logout * * * * * * * * * * */
	@GetMapping("/main")
	public String main(Model model) {

		ArrayList<List<ContentBean>> list = new ArrayList<>();
		for (int i = 1; i <= 4; i++) {
			List<ContentBean> list1 = mainService.getMainList(i);
			list.add(list1);
		}
		List<BoardInfoBean> boardList = adminService.getTopMenuList();
		model.addAttribute("mainList", boardList);
		return "admin/main";

	}

	@GetMapping("/read")
	public String read(@RequestParam("boardInfoIdx") int boardInfoIdx, @RequestParam("contentIdx") int contentIdx,
			Model model) {
		model.addAttribute("boardInfoIdx", boardInfoIdx);
		model.addAttribute("contentIdx", contentIdx);
		ContentBean readContentBean = adminService.getContentInfo(contentIdx);
		model.addAttribute("readContentBean", readContentBean);

		return "admin/main";
	}

	/* 로그인 */
	@GetMapping("/login")
	public String login(@ModelAttribute("tempLoginAdminBean") AdminBean tempLoginAdminBean,
			@RequestParam(value = "fail", defaultValue = "false") boolean fail, Model model) {

		model.addAttribute("fail", fail);

		return "admin/login";
	}

	@PostMapping("/login_pro")
	public String loginPro(@Valid @ModelAttribute("tempLoginAdminBean") AdminBean tempLoginAdminBean,
			BindingResult result) {
		if (result.hasErrors()) {
			return "admin/login";
		}
		adminService.getLoginAdminInfo(tempLoginAdminBean);
		if (loginAdminBean.isAdminLogin()) {
			return "admin/login_success";
		} else {
			return "admin/login_fail";
		}
	}

	@GetMapping("/logout")
	public String logout() {
		loginAdminBean.setAdminLogin(false);
		return "admin/logout";
	}

	@GetMapping("/not_login")
	public String notLogin() {
		return "admin/not_login";
	}

	/* 회원 */
	@GetMapping("/client")
	public String clientList(Model model) {

		List<UserBean> userBeanList = mainService.getUserList();

		if (!userBeanList.isEmpty()) {
			model.addAttribute("list", userBeanList);
			model.addAttribute("boardList", adminService.getTopMenuList());
			return "admin/client/client_list";
		} else {
			return "admin/client/client_null_error";
		}
	}

	@GetMapping("/client/info/{userIdx}")
	public String clientInfo(Model model, @PathVariable("userIdx") int userIdx) {
		model.addAttribute("userAllInfo", adminService.getAllUserInfo(userIdx));
		return "admin/client/client_info";
	}

	/* 주문 관리 */
	@GetMapping("/order")
	public String orderList() {
		return "admin/order/order_list";
	}

	@GetMapping("/order/info")
	public String orderInfo() {
		return "admin/order/order_info";
	}

	/* 상품 */
	@GetMapping("/product")
	public String productList(Model model) {
//		List<ProductInfoBean> productList = productListService.getAllProducts();
//		model.addAttribute("productList", productList);
		return "admin/product/product_list";
	}

	@GetMapping("/product/insert")
	public String productInsert(@RequestParam("productInfoBean") ProductInfoBean productInfoBean, Model model) {
		productListService.addProduct(productInfoBean);
		model.addAttribute(model);
		return "admin/product/product_insert";
	}

	// 상품 생성 페이지 by mingki
	@GetMapping("/product/create")
	public String insertProductView() {
		return "admin/product/product_insert";
	}

	// 특정 상품 정보 조회 by mingki
	@GetMapping("/product/details/{productIdx}")
	public String getProductDetails(@PathVariable("productIdx") int productIdx, Model model) {
		model.addAttribute("product", productListService.getProductDetailsByIdx(productIdx));
		return "admin/product/product_info";
	}

	@GetMapping("/product/product_pro")
	public String register(Model model, ProductInfoBean product, BindingResult result) {
		if (result.hasErrors()) {
			return "admin/product/product_list";
		}
		productListService.addProduct(product);
		return "admin/product/register_pro";
	}

	/* 문의 */
	@GetMapping("/support")
	public String supportList(Model model) {

		List<SupportBean> supportBeanList = supportService.getSupportAll();

		model.addAttribute("list", supportBeanList);
		List<BoardInfoBean> boardList = adminService.getTopMenuList();
		model.addAttribute("boardList", boardList);
		return "admin/support/support_list";
	}

	@GetMapping("/support/info")
	public String supportInfo(Model model, int supportNum) {
		model.addAttribute("support", supportService.getSupport(supportNum));
		return "admin/support/support_info";
	}

	@GetMapping("/support/reply")
	public String supportReply(Model model, SupportBean supportBean, int supportNum) {
		supportService.editSupport(supportBean);
		model.addAttribute("support", supportService.getSupport(supportNum));
		return "admin/support/support_list";
	}

}
