<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\UserController;
use App\Http\Controllers\API\UsermoodController;
use App\Http\Controllers\API\ConsultController;
use App\Http\Controllers\API\JournalController;
use App\Http\Controllers\API\PodcastController;
use App\Http\Controllers\API\ThoughtController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('login', [AuthController::class, 'signin']);
Route::post('register', [AuthController::class, 'signup']);
Route::post('verify-otp', [AuthController::class, 'verifyOTP']);
Route::post('resend-otp', [AuthController::class, 'resendOTP']);
Route::post('forgot-password', [AuthController::class, 'forgotPassword']);



Route::middleware('auth:sanctum')->group( function () {
	Route::get('get-user-info', [UserController::class, 'getUserInfo']);
	Route::post('update-profile', [UserController::class, 'updateProfile']);
	Route::post('change-password', [UserController::class, 'changePasssword']);
	#moods
  	Route::get('get-all-moods', [UsermoodController::class, 'getAllmoods']);
  	Route::get('get-all-sub-moods/{id}', [UsermoodController::class, 'getAllSubmoods']);
  	Route::post('add-mood-tracker', [UsermoodController::class, 'addMoodTracker']);  	
  	Route::get('get-video-mood-based/{id}', [UsermoodController::class, 'getVideoMoodsBased']);
	Route::get('get-all-question/{id}', [UsermoodController::class, 'getAllQuestion']);

	Route::get('get-mood-today', [UsermoodController::class, 'getMoodToday']);
	Route::get('get-mood-week', [UsermoodController::class, 'getMoodWeek']);
	Route::get('get-mood-month', [UsermoodController::class, 'getMoodMonth']);
	Route::post('get-mood-daterange', [UsermoodController::class, 'getMoodDateRange']);

	Route::post('add-user-breathin', [UsermoodController::class, 'addUsersBreathin']);
	Route::post('add-user-academic', [UsermoodController::class, 'addUsersAcademic']);

    Route::post('add-user-video', [UsermoodController::class, 'addUsersVideo']);
    Route::post('add-user-audio', [UsermoodController::class, 'addUsersAudio']);
    
    #consult
    Route::get('get-doctors', [ConsultController::class, 'get_doctors']);
    Route::post('add-appointment', [ConsultController::class, 'add_appointment']);
    Route::get('get-appointment', [ConsultController::class, 'get_appointment']);
    Route::get('get-expertise', [ConsultController::class, 'get_expertise']);
    Route::get('get-languages', [ConsultController::class, 'get_languages']);
    Route::get('get-available-type', [ConsultController::class, 'get_available_type']);

    #Journal
    Route::get('get-journals', [JournalController::class, 'get_journals']);
    Route::get('get-journalsquestion-by-id/{id}', [JournalController::class, 'get_journalsquestionById']);
    Route::post('add-user-journal-question', [JournalController::class, 'addUsersJournalQuestion']);
    Route::get('get-user-journal-question-answer', [JournalController::class, 'getUserJournalQuestionAnswer']);

    #Podcast
    Route::get('get-podcasts', [PodcastController::class, 'get_podcasts']);
    Route::get('get-podcasts-by-mood/{id}', [PodcastController::class, 'get_podcastsByMood']);
    Route::post('add-user-podcast', [PodcastController::class, 'addUserPodcast']);
    Route::get('get-user-podcasts', [PodcastController::class, 'get_Userpodcasts']);


    #Thought
    Route::get('get-thought-category', [ThoughtController::class, 'getThoughtCategory']);
    Route::get('get-thoughts', [ThoughtController::class, 'getThoughts']);
    Route::get('get-thoughts-by-category/{id}', [ThoughtController::class, 'get_thoughtByCategory']);
    Route::post('add-user-thought', [ThoughtController::class, 'addUserThought']);
    Route::get('get-user-thoughts', [ThoughtController::class, 'getUserThoughts']);
    
	Route::post('/logout', [AuthController::class, 'logout']);
});
