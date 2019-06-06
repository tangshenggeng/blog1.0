package ink.tsg.blog.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ink.tsg.blog.bean.FClassification;
import ink.tsg.blog.dao.FClassificationMapper;

@Service
public class FClassificationService {
	
	@Autowired
	private FClassificationMapper  fclassificationMapper;

	public List<FClassification> getFC() {
		return fclassificationMapper.selectByExample(null);
	}

}
