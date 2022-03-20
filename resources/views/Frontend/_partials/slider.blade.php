<div class="col-md-10 col-sm-9">
                  <div class="main_slider">
                    @if($sliders)
                    @foreach($sliders as $key=>$slider)
                    @if(!empty($slider->sub_category_id))
                    <?php 
                        $languageType = 1;
                        $subCategoryName = ($languageType == 1) ? $slider->sub_category_name_lang1 : $slider->sub_category_name_lang1;
                        $subCategoryName = str_replace(' ','-',$subCategoryName);
                     ?>
                    <div class="item">
                      <a href="{{URL::to('subCategoryWiseProduct')}}/{{$slider->sub_category_id}}/{{$subCategoryName}}" target="_blank">
                        <img src="{{URL::to('public/images/slider/',$slider->image_path)}}">
                      </a>
                    </div>
                    @else 
                    <?php 
                        $languageType = 1;
                        $categoryName = ($languageType == 1) ? $slider->category_name_lang1 : $slider->category_name_lang1;
                        $categoryName = str_replace(' ','-',$categoryName);
                     ?>
                      <div class="item">
                      <a href="{{URL::to('categoryWiseProduct')}}/{{$slider->category_id}}/{{$categoryName}}" target="_blank">
                        <img src="{{URL::to('public/images/slider/',$slider->image_path)}}">
                      </a>
                    </div>
                    @endif
                    @endforeach
                    @endif
                  </div>


                  <div class="second_slider">
                    @if(isset($getSelectedProductSliders))
                    @foreach($getSelectedProductSliders as $key=>$productSlider)
                    <div class="product_unit">
                      <a href="{{URL::to('singleProductView')}}/{{$productSlider->product_id}}/{{$productSlider->slug}}" target="_blank">
                        <img src="{{URL::to('public/images/product/',$productSlider->path)}}">
                      </a>
                      <div class="product_unit_content">
                        <a href="{{URL::to('singleProductView')}}/{{$productSlider->product_id}}/{{$productSlider->slug}}" target="_blank">
                          <h2>
                          <?php $languageType = 1; ?>
                            @if($languageType == 1)
                            {{$productSlider->product_name_lang1}}
                            @else 
                            {{$productSlider->product_name_lang2}}
                            @endif
                           </h2>
                        </a>
                        <h3>
                          <?php $languageType = 1; ?>
                            @if($languageType == 1)
                            ৳ {{$productSlider->sale_price}}
                            @else 
                            ৳ {{App\Custom\Helper::bnNum($productSlider->sale_price)}}
                            @endif
                        </h3>
                      </div>
                    </div>
                    @endforeach
                    @endif
                  </div>
                </div>
  </div>
  </div>
  </section>               