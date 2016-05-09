<div class="center">
{if !empty($albums)}

  <ul>

    {each $album in $albums}

      {{ $action = ($album->approved == 1) ? 'disapprovedalbumvideo' : 'approvedalbumvideo' }}
      {{ $absolute_url = Framework\Mvc\Router\Uri::get('video','main','album',"$album->username,$album->title,$album->albumId") }}

      <div class="thumb_photo">
        <a href="{absolute_url}" target="_blank"><img src="{url_data_sys_mod}video/file/{% $album->username %}/{% $album->albumId %}/{% $album->thumb %}" alt="{% $album->name %}" title="{% $album->name %}" /></a>
        <p class="italic">{lang 'Posted by'} <a href="{% $oUser->getProfileLink($album->username) %}" target="_blank">{% $album->username %}</a></p>

        <div>
          {{ $text = ($album->approved == 1) ? t('Disapproved') : t('Approved') }}
          {{ LinkCoreForm::display($text, PH7_ADMIN_MOD, 'moderator', $action, array('album_id'=>$album->albumId)) }} |
          {{ LinkCoreForm::display(t('Delete'), PH7_ADMIN_MOD, 'moderator', 'deletealbumvideo', array('album_id'=>$album->albumId, 'id'=>$album->profileId, 'username'=>$album->username)) }}
        </div>
      </div>

    {/each}

  </ul>

  {main_include 'page_nav.inc.tpl'}

{else}

  <p>{lang 'No Video Albums found for the moderation treatment.'}</p>

{/if}
</div>