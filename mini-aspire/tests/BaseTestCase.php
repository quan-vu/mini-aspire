<?php 

namespace Tests;

use Tests\TestCase;
use Illuminate\Contracts\Console\Kernel;
use Illuminate\Support\Facades\Artisan;

class BaseTestCase extends TestCase
{
    // use CreatesApplication;

    /**
     * Creates the application.
     *
     * @return \Illuminate\Foundation\Application
     */
    public function createApplication()
    {
        return self::initialize();
    }

    private static $configurationApp = null;

    public static function initialize(){

        if(is_null(self::$configurationApp)){
            $app = require __DIR__.'/../bootstrap/app.php';
            $app->loadEnvironmentFrom('.env.testing');
            $app->make(Kernel::class)->bootstrap();

            Artisan::call('migrate');
            Artisan::call('db:seed');

            self::$configurationApp = $app;
            
            return $app;
        }

        return self::$configurationApp;
    }

    // public function tearDown()
    // {
    //     if ($this->app) {
    //         foreach ($this->beforeApplicationDestroyedCallbacks as $callback) {
    //             call_user_func($callback);
    //         }

    //     }

    //     $this->setUpHasRun = false;

    //     if (property_exists($this, 'serverVariables')) {
    //         $this->serverVariables = [];
    //     }

    //     if (class_exists('Mockery')) {
    //         Mockery::close();
    //     }

    //     $this->afterApplicationCreatedCallbacks = [];
    //     $this->beforeApplicationDestroyedCallbacks = [];
    // }
}