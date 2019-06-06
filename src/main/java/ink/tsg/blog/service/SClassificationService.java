package ink.tsg.blog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ink.tsg.blog.bean.SClassification;
import ink.tsg.blog.bean.SClassificationExample;
import ink.tsg.blog.dao.SClassificationMapper;

@Service
public class SClassificationService {
	@Autowired
	private SClassificationMapper sclassificationMapper;
	/**
	 * 等到所有二级分类
	 * */
	public List<SClassification> getSC(SClassificationExample sClassificationExample) {
		return sclassificationMapper.selectByExample(sClassificationExample);
	}
}
