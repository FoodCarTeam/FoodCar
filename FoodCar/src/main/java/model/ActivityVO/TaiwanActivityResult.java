package model.ActivityVO;

import java.util.ArrayList;
import java.util.List;

public class TaiwanActivityResult {

	

		private Integer offset;
		private Integer limit;
		private Integer count;
		private String sort;
		private List<TaiwanActivityResult2> results = new ArrayList<TaiwanActivityResult2>();

		public Integer getOffset() {
		return offset;
		}


		public void setOffset(Integer offset) {
		this.offset = offset;
		}


		public Integer getLimit() {
		return limit;
		}


		public void setLimit(Integer limit) {
		this.limit = limit;
		}

		public Integer getCount() {
		return count;
		}

		public void setCount(Integer count) {
		this.count = count;
		}

		public String getSort() {
		return sort;
		}


		public void setSort(String sort) {
		this.sort = sort;
		}

		public List<TaiwanActivityResult2> getResults() {
		return results;
		}

		public void setResults(List<TaiwanActivityResult2> results) {
		this.results = results;
		}

	
}
