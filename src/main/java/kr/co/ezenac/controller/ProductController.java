package kr.co.ezenac.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.ezenac.beans.ProductInfoBean;
import kr.co.ezenac.service.ProductListService;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	ProductListService productListService;
	
	

	// 리스트 출력 시
	@GetMapping("/list")
	public String list(@RequestParam("productType") String productType,
			@RequestParam("productProperty") String productProperty, Model model) {
		model.addAttribute("productList", productListService.getProductList(productType, productProperty));
		return "user/product/product_list";
	}

	@GetMapping("/search/{productName}")
	public String search(@PathVariable("productName") String productName, Model model) {
		model.addAttribute("searchResult", productListService.searchProduct(productName));
		return "user/product/product_list";
	}

	// 제품 클릭 시
	@GetMapping("/info")
	public String info(@RequestParam("productIdx") int productIdx,
			Model model) {
		ProductInfoBean productInfoBean = productListService.getProductInfo(productIdx);
		model.addAttribute("productInfo", productInfoBean);
		return "user/product/product_info";
	}
/*	
	@GetMapping("/info")
	public String info(@RequestParam("productType") String productType,
			@RequestParam("productProperty") String productProperty, @RequestParam("productIdx") int productIdx,
			Model model) {
		ProductInfoBean productInfoBean = productListService.getProductInfo(productType, productProperty, productIdx);
		model.addAttribute("productInfo", productInfoBean);
		return "user/product/product_info";
	}
*/	
	

	// 상품 생성 & 수정 by mingki
//	@GetMapping({ "/", "" })
//	public String insertProduct(@RequestParam Map<String, Object> product, Model model, HttpServletRequest req) {
//		if (product.get("productIdx") != null) {
//			productListService.updateProduct(product);
//		} else {
//			productListService.insertProduct(product);
//		}
//		return "redirect:/admin/product";
//	}

	// 상품 삭제 by mingki
	@GetMapping("/delete")
	public String deleteProduct(@RequestParam int idx, Model model) {
		productListService.deleteProduct(idx);
		return "admin/product/product_delete";
	}
	// 전체 상품 조회 by mingki
//		@GetMapping({ "/", "" })
//		public String getAllProducts(Model model, @RequestParam(value = "page", defaultValue = "1") int page,
//				HttpServletRequest req) {
//			List<ProductInfoBean> list = productListService.getAllProducts(page);
//			PageBean pageBean = productListService.getAllProductCnt(page);
//			model.addAttribute("productList", list);
//			model.addAttribute("pageBean", pageBean);
//			model.addAttribute("page", page);
//
//			return returnViewByAuth(req.getRequestURI(), "list");
//		}

	// 요청한 uri와 view 따라 jsp 반환
	// (user 페이지에서 상품 조회시 user/product, admin 페이지에서 상품 조회시 admin/product)
//	public String returnViewByAuth(String uri, ) {
//		if (uri.contains("user")) {
//			return "user/product/product_" + viewName;
//		} else {
//			return ;
//		}
//	}

	// 상품 수정 페이지 by mingki
	@GetMapping("/modify")
	public String updateProductView(Model model, HttpServletRequest req, @RequestParam int idx) {
		model.addAttribute("product", productListService.getProductDetailsByIdx(idx));
		return "admin/product/product_update";
	}

}
