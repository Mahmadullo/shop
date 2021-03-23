<div id="sidebar">
            <h3>Categories</h3>
            <div class="mobile-element">
                <select onchange="document.location=this.value">
                    <option>All</option>
                    <optgroup label="Fiction & Literature">
                        <option value="#Children">Children</option>
                        <option value="#Science">Science Fiction</option>
                        <option value="#">Fantasy</option>
                        <option value="#">Mystery</option>
                        <option value="#">Romance</option>
                    </optgroup>
                    <optgroup label="Non - Fiction">
                        <option value="#Children">Children</option>
                        <option value="#Science">Science Fiction</option>
                        <option value="#">Fantasy</option>
                        <option value="#">Mystery</option>
                        <option value="#">Romance</option>
                    </optgroup>
                </select>
            </div>
            <div class="categories desktop-element">
                <div class="categories-group">
                    <ul>
                        <li class="active"><a href="#">All</a></li>
                    </ul>
                </div>
				
                <?php  foreach(CategoryService::getCategoriesForSidebar() as $group => $categories) : ?>
                <div class="categories-group">
                    <h4><?=$group?></h4>
                    <ul>
						<?php  foreach($categories as $category) : ?>
							<li><a href="/?model=product&action=all&category_id=<?$category['id']?>"><?=$category['title']?></a></li>
						<?php endforeach; ?>
                    </ul>
                </div>
				<?php endforeach; ?>
                <!--div class="categories-group">
                    <h4>Non - Fiction</h4>
                    <ul>
                        <li><a href="#">Children</a></li>
                        <li><a href="#">Science Fiction</a></li>
                        <li><a href="#">Fantasy</a></li>
                        <li><a href="#">Mystery</a></li>
                        <li><a href="#">Romance</a></li>
                        <li><a href="#">Horror</a></li>
                        <li><a href="#">Poetry</a></li>
                    </ul>
                </div>
                <div class="categories-group">
                    <h4>Other</h4>
                    <ul>
                        <li><a href="#">Children</a></li>
                        <li><a href="#">Science Fiction</a></li>
                        <li><a href="#">Fantasy</a></li>
                        <li><a href="#">Mystery</a></li>
                    </ul>
                </div-->
            </div>
		</div>