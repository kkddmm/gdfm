package kr.co.gdfm.movie.Page;

public class MoviePaging {

		private int currentPage; // 현재페이지 
    private int totalCount; // 전체 게시물 수
    private int totalPage; // 전체 페이지 수
    private int pageSize; // 한 페이지당 게시물 수
    
    private int startRow; // 시작 게시물 번호
    private int endRow; // 종료 게시물 번호
    
    	
    // 페이지 링크 HTML 데이터를 담는 버퍼
    private StringBuffer page = new StringBuffer();

    
   

	public MoviePaging() {
    	this.currentPage = 1;
    	this.pageSize=6; 
    	
    }
    
    	
    	public MoviePaging(int totalCount, int pageSize, int currentPage) {
    		
    		 this.totalCount = totalCount;
 	        this.pageSize = pageSize;
 	       

 	        // 1. 총페이지 수 구하기
 	        //totalPage = (int) Math.ceil(totalCount / (double) pageSize);
 	        totalPage = (totalCount - 1) / pageSize + 1;
 	        
 	        
 	        // 2. 시작/종료 게시물 번호
 	        startRow = (currentPage - 1) * pageSize + 1;

 	        endRow = currentPage * pageSize;
 	        
 	        if (endRow > totalCount) {
 	            endRow = totalCount;
 	        }
    		
    		
    	}
    
    
    
    
    
			public int getCurrentPage() {
				return currentPage;
			}
			public void setCurrentPage(int currentPage) {
				this.currentPage = currentPage;
			}
			public int getTotalCount() {
				return totalCount;
			}
			public void setTotalCount(int totalCount) {
				this.totalCount = totalCount;
			}
			public int getTotalPage() {
				return totalPage;
			}
			public void setTotalPage(int totalPage) {
				this.totalPage = totalPage;
			}
			public int getPageSize() {
				return pageSize;
			}
			public void setPageSize(int pageSize) {
				this.pageSize = pageSize;
			}
			public int getStartRow() {
				return startRow;
			}
			public void setStartRow(int startRow) {
				this.startRow = startRow;
			}
			public int getEndRow() {
				return endRow;
			}
			public void setEndRow(int endRow) {
				this.endRow = endRow;
			}
			public StringBuffer getPage() {
				return page;
			}


			public void setPage(StringBuffer page) {
				this.page = page;
			}

			
	
	
}
