package com.ddit.game4u.service;

import java.sql.SQLException;
import java.util.Map;

public interface TagkindService {

	Map<String, Object> getTagList() throws SQLException;

}
