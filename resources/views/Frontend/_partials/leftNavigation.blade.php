<section class="menu_and_slider">
    <div class="container">
        <div class="row">
            <!--Start Mega Menu-->
            <div class="col-md-2 col-sm-3 extra-wide">
                <div class="display-for-desktop">
                    <div class="mega_menu">
                        <ul>
                            @if(isset($getMenus))
                            @foreach($getMenus as $menuKey=>$menu)
                            <?php
                            $menuNameWithIconAndId = explode("#", $menuKey);
                            $menuName = $menuNameWithIconAndId[0];
                            $catName = str_replace(' ','-',$menuName);
                            $menuIcon = $menuNameWithIconAndId[1];
                            $menuId   = $menuNameWithIconAndId[2];
                            ?>
                            <li class="gents_collection">
                                <i class="">
                                <img src="{{URL::to('public/images/category/icon_image',$menuIcon)}}" height="10px" width="10px">
                                </i>
                                <a href="{{URL::to('categoryWiseProduct')}}/{{$menuId}}/{{$catName}}">{{$menuName}}</a>
                                
                                <div class="gents_mega_menu">
                                    <div class="row">
                                        @if(!empty($menu))
                                        <?php $i=1; ?>
                                        @foreach($menu as $subMenuKey=>$subMenu)
                                        <?php
                                        $subMenuNameWithId = explode("-",$subMenuKey);
                                        $subMenuName = $subMenuNameWithId[0];
                                        $subCatName = str_replace(' ','-',$subMenuName);
                                        $subMenuId   = $subMenuNameWithId[1];
                                        ?>
                                        <div class="col-md-4 col-sm-4">
                                            @if(($i%3)==0)
                                        </div>
                                        <div class="col-sm-4">
                                            @endif
                                            <a href="{{('subCategoryWiseProduct')}}/{{$subMenuId}}/{{$subCatName}}">
                                                <h2>{{$subMenuName}}</h2>
                                            </a>
                                            
                                            <ul>
                                                @if(!empty($subMenu))
                                                @foreach($subMenu as $subSubMenu)
                                                <?php
                                                    $subSubCatName = str_replace(' ','-',$subSubMenu->sub_sub_category_name_lang1);
                                                ?>
                                                <li>
                                                    <a href="{{('subSubCategoryWiseProduct')}}/{{$subSubMenu->sub_sub_category_id}}/{{$subSubCatName}}">
                                                        {{$subSubMenu->sub_sub_category_name_lang1}}
                                                    </a>
                                                </li>
                                                @endforeach
                                                @endif
                                            </ul>
                                        </div>
                                        <?php $i++; ?>
                                        @endforeach
                                        @endif
                                    </div>
                                </div>
                            </li>
                            @endforeach
                            @endif
                        </ul>
                    </div>
                </div>
            </div>