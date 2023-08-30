<?php
namespace App\Http\Controllers\API;
use App\Http\Controllers\Controller;   
use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use Illuminate\Support\Facades\Auth;
use Validator;
use DB;
use App\Models\User;
use App\Models\Moods;
use App\Models\Moodssub;
use App\Models\Moodstracker;
use App\Models\MoodRecommendation;
use App\Models\MoodQuestion;
use App\Models\Usersacademic;
use App\Models\Usersbreathin;
use App\Models\Audiovideo;
use App\Models\Consultdoctors;
use App\Models\Journal;
use App\Models\Journalquestion;
use App\Models\Usersjournalquestion;
use App\Models\Consultdoctorsappointment;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Carbon;

class JournalController extends BaseController
{
   
    public function get_journals(Request $request) { 
        $user = Auth::user(); 
        if($user){
          	$Journals = Journal::select('journal.*')->orderBy('id', 'desc')->get();  
          
            $question = array();
          	foreach($Journals as $key=>$value){
              if($value['image']){
                $Journals[$key]['image'] = url("public/uploads/journal/".$value['image']);
              }              
              $Journalquestion = Journalquestion::where('journal_id',$value['id'])->orderBy('id', 'desc')->get();
              
              $Journals[$key]['questions'] = $Journalquestion;  
            }
          
			$success['data']  =  $Journals;
            return $this->sendResponse($success, 'Successfully.');	
        }else{
            return $this->sendError('Unauthorised.', ['error'=>'Invalid request data!']);
        }
    }

    public function get_journalsquestionById($id) { 
        $user = Auth::user(); 
        if($user){
          	$Journalquestion = Journalquestion::where('journal_id',$id)->orderBy('id', 'desc')->get();           
          
			$success['data']  =  $Journalquestion;
            return $this->sendResponse($success, 'Successfully.');	
        }else{
            return $this->sendError('Unauthorised.', ['error'=>'Invalid request data!']);
        }
    }

    
    public function addUsersJournalQuestion(Request $request) {

	    $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'journal_id' => 'required',
            'title' => 'required',
            'question_id_1' => 'required',
            'ans_1' => 'required',
        ]);
   
        if($validator->fails()){
            return $this->sendError('Error validation', $validator->errors());       
        }

        $user 	= Auth::user();
		$input 	= $request->all();
		if($user){
			//if(isset($request->question_id[0])){
                $saveArr = array();
			    //for($i=1; $i<=3; $i++){ 

                    if(!empty($request->question_id_1)){

                        $Usersjournalquestion                     = new Usersjournalquestion;
                        $Usersjournalquestion->user_id            = $request->user_id;
                        $Usersjournalquestion->journal_id            = $request->journal_id;
                        $Usersjournalquestion->title              = $request->title;
                        $Usersjournalquestion->question_id        = $request->question_id_1;
                        $Usersjournalquestion->ans                = $request->ans_1;
                        $Usersjournalquestion->save();

                        $saveArr[] = $Usersjournalquestion;
                    }

                    if(!empty($request->question_id_2)){

                        $Usersjournalquestion                     = new Usersjournalquestion;
                        $Usersjournalquestion->user_id            = $request->user_id;
                        $Usersjournalquestion->journal_id            = $request->journal_id;
                        $Usersjournalquestion->title              = $request->title;
                        $Usersjournalquestion->question_id        = $request->question_id_2;
                        $Usersjournalquestion->ans                = $request->ans_2;
                        $Usersjournalquestion->save();

                        $saveArr[] = $Usersjournalquestion;
                    }

                    if(!empty($request->question_id_3)){

                        $Usersjournalquestion                     = new Usersjournalquestion;
                        $Usersjournalquestion->user_id            = $request->user_id;
                        $Usersjournalquestion->journal_id         = $request->journal_id;
                        $Usersjournalquestion->title              = $request->title;
                        $Usersjournalquestion->question_id        = $request->question_id_3;
                        $Usersjournalquestion->ans                = $request->ans_3;
                        $Usersjournalquestion->save();

                        $saveArr[] = $Usersjournalquestion;
                    }
                //}
            //}

			$success['data'] =  $saveArr;
   
			return $this->sendResponse($success, 'Saved Successfully.');
		}else{
			return $this->sendError('Unauthorised.', ['error'=>'Invalid request data!']);
		}

    }

    public function getUserJournalQuestionAnswer(Request $request) { 
        $user = Auth::user();         
        if($user){
          	$Usersjournalquestion = Usersjournalquestion::select('users_journal_question.*')->where('user_id',$user->id)->orderBy('id', 'desc')->get();  
            
            foreach($Usersjournalquestion as $key=>$value){
                if($value['journal_id']){
                    $Journal = Journal::select('journal.*')->where('id',$value['journal_id'])->orderBy('id', 'desc')->first();
                    
                    if(isset($Journal) && ($Journal['image'])){
                        $Journal['image'] = url("public/uploads/journal/".$Journal['image']);
                    }              
                    $Usersjournalquestion[$key]['journal_info'] = $Journal;
                }              
            }
            
          
			$success['data']  =  $Usersjournalquestion;
            return $this->sendResponse($success, 'Successfully.');	
        }else{
            return $this->sendError('Unauthorised.', ['error'=>'Invalid request data!']);
        }
    }
  
  	
}