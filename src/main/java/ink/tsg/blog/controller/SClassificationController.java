package ink.tsg.blog.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ink.tsg.blog.bean.SClassification;
import ink.tsg.blog.bean.SClassificationExample;
import ink.tsg.blog.bean.SClassificationExample.Criteria;
import ink.tsg.blog.service.SClassificationService;
import ink.tsg.utlis.Msg;
/**
 * 二级分类控制层
 * */
@Controller
public class SClassificationController {
	
	@Autowired
	private SClassificationService sclassificationService;
	/**
	 * 根据点击的一级分类，查询二级分类
	 * */
	@RequestMapping(value="/getSC/{scFcId}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getSC(@PathVariable("scFcId") Integer scId) {
		
		SClassificationExample sClassificationExample = new SClassificationExample();
		Criteria criteria = sClassificationExample.createCriteria();
		criteria.andScFcIdEqualTo(scId);
		
		List<SClassification> list = sclassificationService.getSC(sClassificationExample); 
		return Msg.success().add("allSC", list);
	}
	
	
}
