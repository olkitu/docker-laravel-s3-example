<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ImageUploadController;


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

Route::get('/',[ImageUploadController::class, 'image_upload'])->name('image.upload');
Route::post('image-upload',[ImageUploadController::class, 'upload_post_image'])->name('upload.post.image');
