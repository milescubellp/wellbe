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

class PodcastController extends Controller
{

    public function __construct(){
        $this->middleware('auth');
        $this->middleware('admin');
    }

	#Podcasts
	public function all_podcasts(){
		
		$Podcasts = Podcast::select('podcast.*')->orderBy('id', 'desc')->get();  
		
        return view('admin.podcast.list',compact('Podcasts'));
    }
	public function add_podcast(){ 
		$Moods = Moods::select('moods.*')->orderBy('id', 'desc')->get();
        return view('admin.podcast.add',compact('Moods'));
    }
	
	public function add_podcast_action(Request $request){
		
		$request->validate([
            'mood_id'          => ['required'],
            'title'             => ['required'],
            'description'   => ['required'],
            'image'         => 'required|image|mimes:jpg,png,jpeg,gif,svg',
        ]);
		
		if(isset($request->image)){
		    $imageName = time().'.'.$request->image->extension();  
            $request->image->move(public_path('uploads/podcast/'), $imageName); 
		}
		
		$Podcast                    = new Podcast;
		$Podcast->title             = $request->title;		
		$Podcast->mood_id           = $request->mood_id;		
		$Podcast->description       = $request->description;
		$Podcast->image             = $imageName;
		$Podcast->save();
		
        return redirect('/admin/podcast/list')->with('success', 'You have successfully added!');
    }
	
	public function edit_podcast($id){

		$PodcastInfo = Podcast::where('id',$id)->first(); 
		$Moods = Moods::select('moods.*')->orderBy('id', 'desc')->get();
			
        return view('admin.podcast.edit',compact('PodcastInfo','Moods'));
	}
	
	public function edit_podcast_action(Request $request){
		
		$request->validate([
            'mood_id'          => ['required'],
            'title'             => ['required'],
            'description'   => ['required'],
            'image'         => 'required|image|mimes:jpg,png,jpeg,gif,svg',
        ]);
		
				
		$dataArray = array();
		$dataArray['mood_id']          = $request->mood_id;
		$dataArray['title']         = $request->title;
		$dataArray['description']   = $request->description;
		
		if(isset($request->image)){			
			$PodcastInfo = Podcast::where('id',$request->id)->first();
			if(!empty($PodcastInfo->image)){
				$getFilePath = public_path('uploads/podcast/').$PodcastInfo->image;
				if(file_exists($getFilePath)){
					unlink($getFilePath);
				}
			}
		    $imageName = time().'.'.$request->image->extension();  
            $request->image->move(public_path('uploads/podcast/'), $imageName);
			$dataArray['image']  = $imageName;			
		}
		
		Podcast::where('id',$request->id)->update($dataArray);
		
        return redirect('/admin/podcast/list')->with('success', 'You have successfully updated!');
    }
	
	public function delete_podcast($id){
		
		$PodcastInfo = Podcast::where('id',$id)->first();
		if(!empty($PodcastInfo->image)){
			$getFilePath = public_path('uploads/podcast/').$PodcastInfo->image;
			if(file_exists($getFilePath)){
				unlink($getFilePath);
			}
		}
		Podcast::where('id',$id)->delete();
		return redirect('/admin/podcast/list')->with('success', 'You have successfully deleted!');
	}
	
    #Podcasts audio
	public function all_podcast_audios(){
		
		$Podcastaudio = Podcastaudio::select('podcast_audio.*')->orderBy('id', 'desc')->get();  
		
        return view('admin.podcast_audio.list',compact('Podcastaudio'));
    }
	public function add_podcast_audio(){ 
		$Podcasts = Podcast::select('podcast.*')->orderBy('id', 'desc')->get();  
        return view('admin.podcast_audio.add',compact('Podcasts'));
    }
	
    public function add_podcast_audio_action(Request $request){
		
		$request->validate([
            'podcast_id'            => ['required'],
            'title'                 => ['required'],
            'description'           => ['required'],
            'audio'                 => ['required'],
        ]);
				
		$Podcastaudio                    = new Podcastaudio;
		$Podcastaudio->title             = $request->title;		
		$Podcastaudio->podcast_id        = $request->podcast_id;		
		$Podcastaudio->description       = $request->description;
		$Podcastaudio->audio             = $request->audio;
		$Podcastaudio->save();
		
        return redirect('/admin/podcast/audio/list')->with('success', 'You have successfully added!');
    }

    public function edit_podcast_audio($id){

		$PodcastaudioInfo = Podcastaudio::where('id',$id)->first(); 
		$Podcasts = Podcast::select('podcast.*')->orderBy('id', 'desc')->get();
			
        return view('admin.podcast_audio.edit',compact('PodcastaudioInfo','Podcasts'));
	}

    public function edit_podcast_audio_action(Request $request){
		
		$request->validate([
            'podcast_id'            => ['required'],
            'title'                 => ['required'],
            'description'           => ['required'],
            'audio'                 => ['required'],
        ]);
		
		$dataArray = array();
		$dataArray['podcast_id']            = $request->podcast_id;
		$dataArray['title']                 = $request->title;
		$dataArray['description']           = $request->description;
		$dataArray['audio']                 = $request->audio;

		Podcastaudio::where('id',$request->id)->update($dataArray);
		
        return redirect('/admin/podcast/audio/list')->with('success', 'You have successfully updated!');
    }

    public function delete_podcast_audio($id){
		
		Podcastaudio::where('id',$id)->delete();
		return redirect('/admin/podcast/audio/list')->with('success', 'You have successfully deleted!');
	}


	public function upload_podcast_action(Request $request)
    {
        $request->validate([
            'audio' => 'required|mimes:application/octet-stream,audio/mpeg,mpga,mp3,wav',
        ]);
   
		if(isset($request->audio)){
			$fileName = time().'.'.request()->audio->getClientOriginalExtension();
	
			request()->audio->move(public_path('uploads/podcast/'), $fileName);
		}
   
        return response()->json(['success'=>'You have successfully upload file.','file_name'=>$fileName]);
    }	

	
	
	
	
}
