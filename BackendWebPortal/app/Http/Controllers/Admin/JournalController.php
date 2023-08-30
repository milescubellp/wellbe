<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use URL;
use App;
use DB;
use Auth;
use Illuminate\Support\Str;
use file;
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
use App\Models\Consultdoctorsappointment;
use App\Models\Journal;
use App\Models\Journalquestion;

class JournalController extends Controller
{

    public function __construct(){
        $this->middleware('auth');
        $this->middleware('admin');
    }

   
	public function all_journals(){
		
		$journals = Journal::select('journal.*')->orderBy('id', 'desc')->get();  
		
        return view('admin.journal.list',compact('journals'));
    }
	public function add_journal(){ 
		
        return view('admin.journal.add');
    }
	
	public function add_journal_action(Request $request){
		
		$request->validate([
            'title'              => ['required'],
			'description'   	 => ['required'],
            'image'              => 'required|image|mimes:jpg,png,jpeg,gif,svg',
        ]);
		
		if(isset($request->image)){
		    $imageName = time().'.'.$request->image->extension();  
            $request->image->move(public_path('uploads/journal/'), $imageName); 
		}
		
		$Journal                               = new Journal;
        $Journal->user_id           	       = Auth::id();
		$Journal->title            	           = $request->title;
		$Journal->description           	   = $request->description;			
		$Journal->image                        = $imageName;
		$Journal->save();		
		
        return redirect('/admin/journal/list')->with('success', 'You have successfully added!');
    }
	
	public function edit_journal($id){
		
		$JournalInfo = Journal::where('id',$id)->first();
				
        return view('admin.journal.edit',compact('JournalInfo'));
	}
	
	public function edit_journal_action(Request $request){
		
		$request->validate([
            'title'              => ['required'],
			'description'   	 => ['required'],
            'image'              => 'required|image|mimes:jpg,png,jpeg,gif,svg',
        ]);		
				
		$dataArray = array();
		$dataArray['title']            	           = $request->title;
        $dataArray['description']           	   = $request->description;	        
		
		if(isset($request->image)){			
			$JournalInfo = Journal::where('id',$request->id)->first();
			if(!empty($JournalInfo->image)){
				$getFilePath = public_path('uploads/journal/').$JournalInfo->image;
				if(file_exists($getFilePath)){
					unlink($getFilePath);
				}
			}
		    $imageName = time().'.'.$request->image->extension();  
            $request->image->move(public_path('uploads/journal/'), $imageName);
			$dataArray['image']                  = $imageName;			
		}
		
		Journal::where('id',$request->id)->update($dataArray);		
				
        return redirect('/admin/journal/list')->with('success', 'You have successfully updated!');
    }
	
	public function delete_journal($id){
		
		$JournalInfo = Journal::where('id',$id)->first();
		if(!empty($JournalInfo->image)){
			$getFilePath = public_path('uploads/journal/').$JournalInfo->image;
			if(file_exists($getFilePath)){
				unlink($getFilePath);
			}
		}
		Journal::where('id',$id)->delete();
		return redirect('/admin/journal/list')->with('success', 'You have successfully deleted!');
	}

    #QUESTION
	public function all_journalquestion(){
		
		$journalQuestion = Journalquestion::select('journal_question.*')->orderBy('id', 'desc')->get();  
		
        return view('admin.journal_question.list',compact('journalQuestion'));
    }
	public function add_journalquestion(){ 
		$Journals = Journal::select('journal.*')->orderBy('id', 'desc')->get();  
        return view('admin.journal_question.add',compact('Journals'));
    }
	
	public function add_journal_question_action(Request $request){
		
		$request->validate([
            'journal_id'          		=> ['required'],
            'question'          	    => ['required'],
        ]);
		
		$Journalquestion = new Journalquestion;
		$Journalquestion->journal_id            = $request->journal_id;
		$Journalquestion->question     			= $request->question;
		$Journalquestion->answer     			= $request->answer;		
		$Journalquestion->save();
		
        return redirect('/admin/journal/question/list')->with('success', 'You have successfully added!');
    }
	
	public function edit_journalquestion($id){
		
		$JournalquestionInfo = Journalquestion::where('id',$id)->first();
        $Journals = Journal::select('journal.*')->orderBy('id', 'desc')->get();
				
        return view('admin.journal_question.edit',compact('JournalquestionInfo','Journals'));
	}
	
	public function edit_journal_question_action(Request $request){
		
		$request->validate([
            'journal_id'          		=> ['required'],
            'question'          	    => ['required'],
        ]);
		
		$dataArray = array();
		$dataArray['journal_id']            	= $request->journal_id;			
		$dataArray['question']     				= $request->question;
		$dataArray['answer']     				= $request->answer;	
		
		Journalquestion::where('id',$request->id)->update($dataArray);
		
        return redirect('/admin/journal/question/list')->with('success', 'You have successfully updated!');
    }
	
	public function delete_journalquestion($id){
		
		Journalquestion::where('id',$id)->delete();
		return redirect('/admin/journal/question/list')->with('success', 'You have successfully deleted!');
	}		
	
}
