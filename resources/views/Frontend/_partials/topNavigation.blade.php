<header class="header">
      <div class="container">
        <div class="row">
          <div class="display-for-desktop">
            <!--Start Logo-->
            <div class="col-md-3">
              <a href="{{URL::to('/')}}" class="logo">
                <img src="{{URL::to('public/frontend/assets/img/logo.png')}}" alt="">
              </a>
            </div>
            <!--Close Logo-->
            <div class="col-md-9">
              <div class="search_wrapper">
                <div class="row">
                  <div class="col-md-10 col-sm-10">
                    <div class="search_box">
                      <form method="POST" action="" accept-charset="UTF-8">
                        <input name="_token" type="hidden" value="">
                      <div class="row">
                        <div class="col-md-9 col-sm-9">
                          <div class="search_input_box">
                            <input type="text" name="search_content" id="search_box_desktop" placeholder="Search Product">
                          </div>
                        </div>
                        <div class="col-md-3 col-sm-3">
                          <ul class="select_input_category">
                            <li style=" float: left;">
                              <select name="search_type" id="SearchSelectDesktop">
                                <option value="1">All</option>
                                <option value="2">Product</option>
                                <option value="3">Merchant</option>
                              </select>
                            </li>
                            <li style=" float: left;">
                              <button type="submit">
                              <i class="fa fa-search"></i>
                              </button>
                            </li>
                          </ul>
                        </div>
                      </div>
                    </form>
                    </div><!--search_box -->
                    </div><!--col-md-10 -->
                    <div class="col-md-1 col-sm-1">
                      <div class="shopping_cart">
                        <a class="loadModal" data-toggle="modal" href="#modal" onclick="loadModal('shoppingCartModal')">
                          <i class="fa fa-shopping-cart"></i>
                        </a>
                      </div>
                      </div><!--col-md-2 -->
                      <!--<div class="col-md-1 col-sm-1">-->
                      <!--    <p><strong>Helpline: 01633666222</strong></p>-->
                      <!--</div>-->
                    </div>
                    <div class="col-md-10 col-sm-10" id="item_list_div_desktop" style="display: none;position: absolute;font-size: 14px;z-index: 201;overflow: hidden">
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </header>
<!--Start Top Menu -->
        <section class="top_menu">
          <div class="container">
            <div class="row">
              <div class="col-md-12">
                <ul class="list-inline">
                @if(count($topMenuCategories) > 0)
                @foreach($topMenuCategories as $key=> $topMenuCategory)
                <?php $categoryName = str_replace(' ', '-', $topMenuCategory->category_name_lang1) ?>
                  <li>
                    <a href="{{URL::to('categoryWiseProduct')}}/{{$topMenuCategory->category_id}}/{{$categoryName}}">
                      <?php $languageType = 1; ?>
                      @if($languageType == 1)
                          {{$topMenuCategory->category_name_lang1}}
                      @else 
                          {{$topMenuCategory->category_name_lang2}}
                      @endif
                    </a>
                  </li>
                @endforeach  
                @endif
                </ul>
              </div>
            </div>
          </div>
        </section>
        <!--Close Top Menu -->