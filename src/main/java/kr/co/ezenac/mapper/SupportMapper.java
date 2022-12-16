package kr.co.ezenac.mapper;

import java.util.List;

import kr.co.ezenac.beans.SupportBean;

public interface SupportMapper {

	List<SupportBean> getSupportAll();

	SupportBean getSupport(int supportNum);

	int editSupport(SupportBean supportBean);

	List<SupportBean> searchSupport(SupportBean supportBean);

	int writeSupport(SupportBean supportBean);

	int deleteSupport(SupportBean supportBean);

}
