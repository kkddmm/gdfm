package kr.co.gdfm.main.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gdfm.main.mapper.MainMapper;
import kr.co.gdfm.main.service.MainService;
import kr.co.gdfm.member.model.Member;
import kr.co.gdfm.movie.model.Movie;


@Service("mainService")
public class MainServiceImpl implements MainService{

	
	@Autowired
	MainMapper mainMapper;	
	
	
	@Override
	public List<Movie> getMainMovieChartWithNoLogin() throws Exception {
		
		return mainMapper.getMainMovieChartWithNoLogin();
	}

	@Override
	public List<Movie> getMainMovieChartWithLogin(Member member) throws Exception {
		// TODO Auto-generated method stub
		return mainMapper.getMainMovieChartWithLogin(member);
	}

	@Override
	public List<Movie> mainOpenMovieList() throws Exception {
		
		return mainMapper.mainOpenMovieList(); 
	}

	@Override
	public List<Movie> mainPreMovieList() throws Exception {
		
		return mainMapper.mainPreMovieList();
	}




	
	
	
}
