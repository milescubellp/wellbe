<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Admin\ConsultController;
use App\Http\Controllers\Admin\JournalController;
use App\Http\Controllers\Admin\PodcastController;
use App\Http\Controllers\Admin\ThoughtController;
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

/* Route::get('/', function () {
    return view('welcome');
}); */

Auth::routes();

#ADMIN ROUTES
Route::group(['namespace' => 'Admin','prefix' => 'admin','middleware' => ['auth','admin']], function () {
	#DASHBOARD
	Route::get('/dashboard', [AdminController::class, 'index'])->name('dashboard.index');
	
	#CUSTOMER
	Route::get('/customer/list', [AdminController::class, 'all_customer'])->name('dashboard.all_customer');
	Route::get('/customer/add', [AdminController::class, 'add_customer'])->name('dashboard.add_customer');
	Route::post('/add_customer_action', [AdminController::class, 'add_customer_action'])->name('dashboard.add_customer_action');
	Route::get('/customer/edit/{id}', [AdminController::class, 'edit_customer'])->name('dashboard.edit_customer');
	Route::post('/edit_customer_action', [AdminController::class, 'edit_customer_action'])->name('dashboard.edit_customer_action');
	Route::get('/customer/delete/{id}', [AdminController::class, 'delete_customer'])->name('dashboard.delete_customer');
	
	#MOODS
	Route::get('/mood/list', [AdminController::class, 'all_moods'])->name('dashboard.all_moods');
	Route::get('/mood/add', [AdminController::class, 'add_mood'])->name('dashboard.add_mood');
	Route::post('/add_mood_action', [AdminController::class, 'add_mood_action'])->name('dashboard.add_mood_action');
	Route::get('/mood/edit/{id}', [AdminController::class, 'edit_mood'])->name('dashboard.edit_mood');
	Route::post('/edit_mood_action', [AdminController::class, 'edit_mood_action'])->name('dashboard.edit_mood_action');
	Route::get('/mood/delete/{id}', [AdminController::class, 'delete_mood'])->name('dashboard.delete_mood');
	
	#RECOMMENDATION
	Route::get('/mood/recommendation/list', [AdminController::class, 'all_recommendation'])->name('dashboard.all_recommendation');
	Route::get('/mood/recommendation/add', [AdminController::class, 'add_recommendation'])->name('dashboard.add_recommendation');
	Route::post('/add_recommendation_action', [AdminController::class, 'add_recommendation_action'])->name('dashboard.add_recommendation_action');
	Route::get('/mood/recommendation/edit/{id}', [AdminController::class, 'edit_recommendation'])->name('dashboard.edit_recommendation');
	Route::post('/edit_recommendation_action', [AdminController::class, 'edit_recommendation_action'])->name('dashboard.edit_recommendation_action');
	Route::get('/mood/recommendation/delete/{id}', [AdminController::class, 'delete_recommendation'])->name('dashboard.delete_recommendation');
	
	Route::post('/upload_recommendation_action', [AdminController::class, 'upload_recommendation_action'])->name('dashboard.upload_recommendation_action');
	Route::get('/recommendation/file/delete/{id}', [AdminController::class, 'delete_recommendation_file'])->name('dashboard.delete_recommendation_file');

	#QUESTION
	Route::get('/mood/question/list', [AdminController::class, 'all_question'])->name('dashboard.all_question');
	Route::get('/mood/question/add', [AdminController::class, 'add_question'])->name('dashboard.add_question');
	Route::post('/add_question_action', [AdminController::class, 'add_question_action'])->name('dashboard.add_question_action');
	Route::get('/mood/question/edit/{id}', [AdminController::class, 'edit_question'])->name('dashboard.edit_question');
	Route::post('/edit_question_action', [AdminController::class, 'edit_question_action'])->name('dashboard.edit_question_action');
	Route::get('/mood/question/delete/{id}', [AdminController::class, 'delete_question'])->name('dashboard.delete_question');
	Route::get('/mood/academic/list/{id}', [AdminController::class, 'all_academic'])->name('dashboard.all_academic');
	
	#MOODSTRACKER
	Route::get('/mood/tracker/list/{id}', [AdminController::class, 'all_mood_tracker'])->name('dashboard.all_mood_tracker');
	Route::get('/mood/breathin/list/{id}', [AdminController::class, 'all_breathin'])->name('dashboard.all_breathin');

    #consult   
    Route::get('/doctor/list', [ConsultController::class, 'get_doctors'])->name('dashboard.get_doctors');
	Route::get('/doctor/add', [ConsultController::class, 'add_doctor'])->name('dashboard.add_doctor');
	Route::post('/add_doctor_action', [ConsultController::class, 'add_doctor_action'])->name('dashboard.add_doctor_action');
	Route::get('/doctor/edit/{id}', [ConsultController::class, 'edit_doctor'])->name('dashboard.edit_doctor');
	Route::post('/edit_doctor_action', [ConsultController::class, 'edit_doctor_action'])->name('dashboard.edit_doctor_action');
	Route::get('/doctor/delete/{id}', [ConsultController::class, 'delete_doctor'])->name('dashboard.delete_doctor');

    Route::get('/doctor/appointment/list', [ConsultController::class, 'get_appointment_list'])->name('dashboard.get_appointment_list');

    #Journal
	Route::get('/journal/list', [JournalController::class, 'all_journals'])->name('dashboard.all_journals');
	Route::get('/journal/add', [JournalController::class, 'add_journal'])->name('dashboard.add_journal');
	Route::post('/add_journal_action', [JournalController::class, 'add_journal_action'])->name('dashboard.add_journal_action');
	Route::get('/journal/edit/{id}', [JournalController::class, 'edit_journal'])->name('dashboard.edit_journal');
	Route::post('/edit_journal_action', [JournalController::class, 'edit_journal_action'])->name('dashboard.edit_journal_action');
	Route::get('/journal/delete/{id}', [JournalController::class, 'delete_journal'])->name('dashboard.delete_journal');
    
    #Journal Question
    Route::get('/journal/question/list', [JournalController::class, 'all_journalquestion'])->name('dashboard.all_journalquestion');
	Route::get('/journal/question/add', [JournalController::class, 'add_journalquestion'])->name('dashboard.add_journalquestion');
	Route::post('/add_journal_question_action', [JournalController::class, 'add_journal_question_action'])->name('dashboard.add_journal_question_action');
	Route::get('/journal/question/edit/{id}', [JournalController::class, 'edit_journalquestion'])->name('dashboard.edit_journalquestion');
	Route::post('/edit_journal_question_action', [JournalController::class, 'edit_journal_question_action'])->name('dashboard.edit_journal_question_action');
	Route::get('/journal/question/delete/{id}', [JournalController::class, 'delete_journalquestion'])->name('dashboard.delete_journalquestion');

    #Podcast
	Route::get('/podcast/list', [PodcastController::class, 'all_podcasts'])->name('dashboard.all_podcasts');
	Route::get('/podcast/add', [PodcastController::class, 'add_podcast'])->name('dashboard.add_podcast');
	Route::post('/add_podcast_action', [PodcastController::class, 'add_podcast_action'])->name('dashboard.add_podcast_action');
	Route::get('/podcast/edit/{id}', [PodcastController::class, 'edit_podcast'])->name('dashboard.edit_podcast');
	Route::post('/edit_podcast_action', [PodcastController::class, 'edit_podcast_action'])->name('dashboard.edit_podcast_action');
	Route::get('/podcast/delete/{id}', [PodcastController::class, 'delete_podcast'])->name('dashboard.delete_podcast');

    #Podcast Audio
	Route::get('/podcast/audio/list', [PodcastController::class, 'all_podcast_audios'])->name('dashboard.all_podcast_audios');
	Route::get('/podcast/audio/add', [PodcastController::class, 'add_podcast_audio'])->name('dashboard.add_podcast_audio');
	Route::post('/add_podcast_audio_action', [PodcastController::class, 'add_podcast_audio_action'])->name('dashboard.add_podcast_audio_action');
	Route::get('/podcast/audio/edit/{id}', [PodcastController::class, 'edit_podcast_audio'])->name('dashboard.edit_podcast_audio');
	Route::post('/edit_podcast_audio_action', [PodcastController::class, 'edit_podcast_audio_action'])->name('dashboard.edit_podcast_audio_action');
	Route::get('/podcast/audio/delete/{id}', [PodcastController::class, 'delete_podcast_audio'])->name('dashboard.delete_podcast_audio');
	Route::post('/upload_podcast_action', [PodcastController::class, 'upload_podcast_action'])->name('dashboard.upload_podcast_action');

    #thought Category
	Route::get('/thought/category/list', [ThoughtController::class, 'all_thought_category'])->name('dashboard.all_thought_category');
	Route::get('/thought/category/add', [ThoughtController::class, 'add_thought_category'])->name('dashboard.add_thought_category');
	Route::post('/add_thought_category_action', [ThoughtController::class, 'add_thought_category_action'])->name('dashboard.add_thought_category_action');
	Route::get('/thought/category/edit/{id}', [ThoughtController::class, 'edit_thought_category'])->name('dashboard.edit_thought_category');
	Route::post('/edit_thought_category_action', [ThoughtController::class, 'edit_thought_category_action'])->name('dashboard.edit_thought_category_action');
	Route::get('/thought/category/delete/{id}', [ThoughtController::class, 'delete_thought_category'])->name('dashboard.delete_thought_category');

    #thought
	Route::get('/thought/list', [ThoughtController::class, 'all_thoughts'])->name('dashboard.all_thoughts');
	Route::get('/thought/add', [ThoughtController::class, 'add_thought'])->name('dashboard.add_thought');
	Route::post('/add_thought_action', [ThoughtController::class, 'add_thought_action'])->name('dashboard.add_thought_action');
	Route::get('/thought/edit/{id}', [ThoughtController::class, 'edit_thought'])->name('dashboard.edit_thought');
	Route::post('/edit_thought_action', [ThoughtController::class, 'edit_thought_action'])->name('dashboard.edit_thought_action');
	Route::get('/thought/delete/{id}', [ThoughtController::class, 'delete_thought'])->name('dashboard.delete_thought');
    Route::post('/upload_thought_action', [ThoughtController::class, 'upload_thought_action'])->name('dashboard.upload_thought_action');
   

    #LOGOUT
	Route::post('/logout', [\App\Http\Controllers\Auth\LoginController::class, 'logout']);
});

Route::get('/', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::get('cli/clear',function(){
	Artisan::call('cache:clear');
    Artisan::call('config:clear');
    Artisan::call('config:cache');
    Artisan::call('view:clear');
    Artisan::call('route:cache');
	return "clear";
});