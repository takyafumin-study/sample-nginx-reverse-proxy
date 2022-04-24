<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function (Request $request) {
    echo 'frontend - Top Page';
    echo "<br/>";
    echo "サーバホスト名: " . $request->server('HOSTNAME');
});

Route::get('/frontend', function (Request $request) {
    echo 'frontend - frontend/';
    echo "<br/>";
    echo "サーバホスト名: " . $request->server('HOSTNAME');
});

Route::get('/backend/specially-path', function (Request $request) {
    echo 'frontend - backend/specially-path';
    echo "<br/>";
    echo "サーバホスト名: " . $request->server('HOSTNAME');
});
