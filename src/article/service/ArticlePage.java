package article.service;

import java.util.List;

import article.model.Article;

// 한 페이지에서 보여줄 게시글 정보와 페이지 관련 정보를 담는 클래스
// 페이지(게시글 목록의 한 화면)에 여기서 담겨있는 내용을 출력할 예정
public class ArticlePage {

	private List<Article> articleList; // 게시글 내용을 담고있는 객체들의 리스트
	// articleId, writerId, writerName, title, 생성일, 수정일, 조회수
	
	private int currentPage; // 사용자가 요청한 페이지 번호
	private int totalPages; // 전체 페이지 수 (게시글의 수 X)
	// 페이지 하나당 10개의 게시글이 들어가는데.. 총 게시글이 11개이면 총 페이지가 2개가 된다
	private int totalArticles; // 전체 게시글의 갯수
	private int startPage; // 화면 하단의 페이지 보여줄 링크의 시작번호 
	private int endPage; // 화면 하단의 페이지 보여줄 링크의 끝번호
	
	
	
	
	public ArticlePage(List<Article> articleList, int currentPage, int totalArticles, int size, int blockSize) {

		// size는 한 페이지에 보여줄 게시글의 갯수
		// blockSize는 한 페이지에서 보여줄 하단 페이지 링크 블럭 개수
		
		this.articleList = articleList;
		this.currentPage = currentPage;
		this.totalArticles = totalArticles;
		
		// 전체 게시글 수가 없을 때
		if(totalArticles == 0) {
			
			totalPages = 0;
			startPage = 0;
			endPage = 0;
			
		// 게시글이 하나라도 존재할 때
		}else {

			totalPages = totalArticles / size;
			
			// 페이지 수를 사이즈로 나눴을 때 나머지가 생기면
			if(totalArticles % size > 0) {
				// 페이지 수를 늘려줌
				totalPages ++;
			}
			
			// [6][7][8][9][10]
			// currentPage : 6 이고 blockSize : 5 라면 statrPage는 6이된다
			
			
			// 나머지를 없애기 위해서 인데 
			// currentPage가 5일때는 6으로 넘어가버린다
			startPage = currentPage / blockSize * blockSize + 1;
			
			// 이것을 처리해주기위해
			// 현재 페이지가 블록 사이즈로 나누어 떨어질 때
			// 즉 5나 10이나 15일때
			if((currentPage % blockSize) == 0) {
				// 시작페이지를 하나 줄여주는 작업
				startPage -= blockSize;
				
			}
			
			
			
			endPage = startPage + (blockSize - 1);
			// [1][2][3][4][5] 이고 게시글이 [1][2][3] 까지 밖에면다면 
			// [4][5]페이지는 잘라주는 작업
			if(endPage > totalPages) {
				endPage = totalPages;
			}

		}

	}


	
	
	
	// article이 하나라도 존재할 때
	public boolean hasArticles() {
		
		return totalArticles > 0;
		
	}
	
	

	
	

	public List<Article> getArticleList() {
		return articleList;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public int getTotalArticles() {
		return totalArticles;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	} 
	
	
	
}
