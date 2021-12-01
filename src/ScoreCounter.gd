extends Node2D

var score = 0
var keep_score = false

func _on_Score_timeout():
	if keep_score:
		score += 1
		print(score)
		$ScoreTimer.start()
	else: pass
