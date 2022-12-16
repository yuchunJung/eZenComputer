package kr.co.ezenac.service;

import java.util.List;
import java.util.Map;

import kr.co.ezenac.beans.PageBean;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ezenac.beans.ProductInfoBean;
import kr.co.ezenac.mapper.ProductListMapper;

@Service
public class ProductListService {

	@Autowired
	private ProductListMapper plMapper;

	public void addProduct(ProductInfoBean productInfoBean) {
		plMapper.addProduct(productInfoBean);
	}

	public List<ProductInfoBean> getProductList(@Param("productType") String productType,
			@Param("productProperty") String productProperty) {
		return plMapper.getProductList(productType, productProperty);
	}

	public ProductInfoBean getProductInfo(@Param("productNo") int productNo) {
		return plMapper.getProductInfo(productNo);
	}
/*	
	public ProductInfoBean getProductInfo(@Param("productType") String productType,
			@Param("productProperty") String productProperty, @Param("productNo") int productNo) {
		return plMapper.getProductInfo(productType, productProperty, productNo);
	}
*/	

	// 제품 검색
	public List<ProductInfoBean> searchProduct(@Param("ProductName") String productName) {
		return plMapper.searchProduct(productName);
	}

	public void deleteProduct(int productIdx) {
		plMapper.deleteProductByIdx(productIdx);
	}

	public List<ProductInfoBean> getAllProducts(int page, PageBean pageBean) {
		RowBounds rowBounds = new RowBounds();
		return plMapper.getAllProducts(rowBounds);
	}

//	public PageBean getAllProductCnt(int page, PageBean pageBean) {
//		int productCnt = plMapper.getProductCnt();
//		return new PageBean(productCnt, page);
//	}

	public void insertProduct(ProductInfoBean product) {
		plMapper.insertProduct(product);
	}

	public void updateProduct(ProductInfoBean product) {
		plMapper.updateProduct(product);
	}

	public ProductInfoBean getProductDetailsByIdx(int productIdx) {
		return plMapper.getProductDetailsByIdx(productIdx);
	}

}
