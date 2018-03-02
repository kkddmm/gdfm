package kr.co.gdfm.movie.service.impl;



import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gdfm.movie.mapper.MovieReviewMapper;
import kr.co.gdfm.movie.model.MovieReview;
import kr.co.gdfm.movie.service.MovieReviewService;


@Service("movieReviewService")
public class MovieReviewServiceImpl implements MovieReviewService {

	
	@Autowired
	MovieReviewMapper movieReviewMapper;
	
	
	

			@Override
			public int movieReviewCount(Map<String, Object> paramMap) {
				// TODO Auto-generated method stub
				return 0;
			}
		
			
			@Override
			public int insertMovieReview(MovieReview moviereview) {
				
				
				
				try {
					int  movieReviewinsert= movieReviewMapper.movieReviewInsert(moviereview);
					
					return movieReviewinsert;
					
					
				} catch(RuntimeException e) {
					e.printStackTrace();
					return 30;
				}
			
			}

			@Override
			public int updateMovieReview(MovieReview moviereview)  {
				// TODO Auto-generated method stub
				return movieReviewMapper.movieReviewUpdate(moviereview);
				
			}

			@Override
			public int deleteMovieReview(MovieReview moviereview)  {
				// TODO Auto-generated method stub
				return movieReviewMapper.movieReviewDelete(moviereview);
			}

			@Override
			public List<MovieReview> selectReviewList(int movie_id) {
				// TODO Auto-generated method stub
				return movieReviewMapper.selectReviewList(movie_id);
			}


			@Override
			public int duplicationChk(Map<String, Object> params) {
				
				return movieReviewMapper.duplicationChk(params);
			}


			@Override
			public int insertUpDown(Map<String, Object> params) {
				
				return movieReviewMapper.insertUpDown(params);
			}
		
	
	
	
	
	
	
	

	
	
	
	
}
