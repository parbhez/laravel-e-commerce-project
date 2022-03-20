<?php

namespace App\Providers;

use Illuminate\Support\Facades\Route;
use Illuminate\Foundation\Support\Providers\RouteServiceProvider as ServiceProvider;

class RouteServiceProvider extends ServiceProvider
{
    /**
     * This namespace is applied to your controller routes.
     *
     * In addition, it is set as the URL generator's root namespace.
     *
     * @var string
     */
    protected $namespace = 'App\Http\Controllers';
    protected $namespaceBackend = 'App\Http\Controllers\Backend';
    protected $namespaceBackendSettings = 'App\Http\Controllers\Backend\Settings';
    protected $namespaceBackendProducts = 'App\Http\Controllers\Backend\Products';
    protected $namespaceBackendSliders = 'App\Http\Controllers\Backend\Sliders';
    protected $namespaceFrontend = 'App\Http\Controllers\Frontend';

    /**
     * Define your route model bindings, pattern filters, etc.
     *
     * @return void
     */
    public function boot()
    {
        //

        parent::boot();
    }

    /**
     * Define the routes for the application.
     *
     * @return void
     */
    public function map()
    {
        $this->mapApiRoutes();

        $this->mapWebRoutes();

        //
    }

    /**
     * Define the "web" routes for the application.
     *
     * These routes all receive session state, CSRF protection, etc.
     *
     * @return void
     */
    protected function mapWebRoutes()
    {
        Route::middleware('web')
             ->namespace($this->namespace)
             ->group(base_path('routes/web.php'));

        Route::middleware('web')
             ->namespace($this->namespaceBackend)
             ->group(base_path('routes/Backend/Routes.php'));

        Route::middleware('web')
             ->namespace($this->namespaceBackendSettings)
             ->group(base_path('routes/Backend/SettingsRoutes.php'));

        Route::middleware('web')
             ->namespace($this->namespaceBackendProducts)
             ->group(base_path('routes/Backend/ProductsRoutes.php')); 

        Route::middleware('web')
             ->namespace($this->namespaceBackendSliders)
             ->group(base_path('routes/Backend/SlidersRoutes.php'));      

        Route::middleware('web')
             ->namespace($this->namespaceFrontend)
             ->group(base_path('routes/Frontend/Routes.php'));                    
    }

    /**
     * Define the "api" routes for the application.
     *
     * These routes are typically stateless.
     *
     * @return void
     */
    protected function mapApiRoutes()
    {
        Route::prefix('api')
             ->middleware('api')
             ->namespace($this->namespace)
             ->group(base_path('routes/api.php'));
    }
}
