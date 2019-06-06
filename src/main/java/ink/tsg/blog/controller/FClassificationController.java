package ink.tsg.blog.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ink.tsg.blog.bean.FClassification;
import ink.tsg.blog.service.FClassificationService;
import ink.tsg.utlis.Msg;

@Controller
public class FClassificationController {
	
	@Autowired
	private FClassificationService fclassificationService;
	
	/**
	 * 联动查询一级分类下的所有分类
	 * */
	@RequestMapping(value="/getFC",method=RequestMethod.GET)
	@ResponseBody
	public Msg getFCAndSC() {
		List<FClassification> list=fclassificationService.getFC();
		return Msg.success().add("allFC", list);
	}
}