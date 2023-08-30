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
use App\Models\Podcast;
use App\Models\Podcastaudio;
use App\Models\Thought;
use App\Models\Thoughtcategory;

class ThoughtController extends Controller
{

    public function __construct(){
        $this->middleware('auth');
        $this->middleware('admin');
    }

	#Thought category
	public function all_thought_category(){
		
		$Thoughtcategory = Thoughtcategory::select('thought_category.*')->orderBy('id', 'desc')->get();  
		
        return view('admin.thought_category.list',compact('Thoughtcategory'));
    }
	public function add_thought_category(){
        return view('admin.thought_category.add');
    }
	
	public function add_thought_category_action(Request $request){
		
		$request->validate([
            'title'             => ['required'],
            'description'   => ['required'],
            'image'         => 'required|image|mimes:jpg,png,jpeg,gif,svg',
        ]);
		
		if(isset($request->image)){
		    $imageName = time().'.'.$request->image->extension();  
            $request->image->move(public_path('uploads/thought/'), $imageName); 
		}
		
		$Thoughtcategory                    = new Thoughtcategory;
		$Thoughtcategory->title             = $request->title;		
		$Thoughtcategory->description       = $request->description;
		$Thoughtcategory->image             = $imageName;
		$Thoughtcategory->save();
		
        return redirect('/admin/thought/category/list')->with('success', 'You have successfully added!');
    }
	
	public function edit_thought_category($id){

		$ThoughtcategoryInfo = Thoughtcategory::where('id',$id)->first();
			
        return view('admin.thought_category.edit',compact('ThoughtcategoryInfo'));
	}
	
	public function edit_thought_category_action(Request $request){
		
		$request->validate([
            'title'             => ['required'],
            'description'   => ['required'],
            'image'         => 'required|image|mimes:jpg,png,jpeg,gif,svg',
        ]);
		
				
		$dataArray = array();
		$dataArray['title']         = $request->title;
		$dataArray['description']   = $request->description;
		
		if(isset($request->image)){			
			$ThoughtcategoryInfo = Thoughtcategory::where('id',$request->id)->first();
			if(!empty($ThoughtcategoryInfo->image)){
				$getFilePath = public_path('uploads/thought/').$ThoughtcategoryInfo->image;
				if(file_exists($getFilePath)){
					unlink($getFilePath);
				}
			}
		    $imageName = time().'.'.$request->image->extension();  
            $request->image->move(public_path('uploads/thought/'), $imageName);
			$dataArray['image']  = $imageName;			
		}
		
		Thoughtcategory::where('id',$request->id)->update($dataArray);
		
        return redirect('/admin/thought/category/list')->with('success', 'You have successfully updated!');
    }
	
	public function delete_thought_category($id){
		
		$ThoughtcategoryInfo = Thoughtcategory::where('id',$id)->first();
		if(!empty($PodcastInfo->image)){
			$getFilePath = public_path('uploads/thought/').$ThoughtcategoryInfo->image;
			if(file_exists($getFilePath)){
				unlink($getFilePath);
			}
		}
		Thoughtcategory::where('id',$id)->delete();
		return redirect('/admin/thought/category/list')->with('success', 'You have successfully deleted!');
	}
	
    #thought
	public function all_thoughts(){
		
		$Thought = Thought::select('thought.*')->orderBy('id', 'desc')->get();  
		
        return view('admin.thought.list',compact('Thought'));
    }
	public function add_thought(){ 
		$Thoughtcategory = Thoughtcategory::select('thought_category.*')->orderBy('id', 'desc')->get();    
        return view('admin.thought.add',compact('Thoughtcategory'));
    }
	
    public function add_thought_action(Request $request){
		
		$request->validate([
            'category_id'           => ['required'],
            'title'                 => ['required'],
            'description'           => ['required'],
            'file_type'             => ['required'],
            'audio_video'           => ['required'],
        ]);
				
		$Thought                    = new Thought;
        $Thought->category_id       = $request->category_id;
		$Thought->title             = $request->title;		
		$Thought->file_type         = $request->file_type;		
		$Thought->description       = $request->description;
		$Thought->audio_video       = $request->audio_video;
		$Thought->save();
		
        return redirect('/admin/thought/list')->with('success', 'You have successfully added!');
    }

    public function edit_thought($id){

		$ThoughtInfo = Thought::where('id',$id)->first(); 
		$Thoughtcategory = Thoughtcategory::select('thought_category.*')->orderBy('id', 'desc')->get(); 
			
        return view('admin.thought.edit',compact('ThoughtInfo','Thoughtcategory'));
	}

    public function edit_thought_action(Request $request){
		
		$request->validate([
            'category_id'           => ['required'],
            'title'                 => ['required'],
            'description'           => ['required'],
            'file_type'             => ['required'],
            'audio_video'           => ['required'],
        ]);
		
		$dataArray = array();
		$dataArray['category_id']           = $request->category_id;
		$dataArray['title']                 = $request->title;
		$dataArray['description']           = $request->description;
        $dataArray['file_type']             = $request->file_type;
		$dataArray['audio_video']           = $request->audio_video;

		Thought::where('id',$request->id)->update($dataArray);
		
        return redirect('/admin/thought/list')->with('success', 'You have successfully updated!');
    }

    public function delete_thought($id){
		
		Thought::where('id',$id)->delete();
		return redirect('/admin/thought/list')->with('success', 'You have successfully deleted!');
	}


	public function upload_thought_action(Request $request)
    {
        $request->validate([
            'audio_video' => 'required',
        ]);
   
		if(isset($request->audio_video)){
			$fileName = time().'.'.request()->audio_video->getClientOriginalExtension();
	
			request()->audio_video->move(public_path('uploads/thought/'), $fileName);
		}
   
        return response()->json(['success'=>'You have successfully upload file.','file_name'=>$fileName]);
    }	

}
