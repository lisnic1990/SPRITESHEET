package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import iso.Directions;
	import iso.SpriteSheet;

	/**
	 * ...
	 * @author Anggie Bratadinata | www.masputih.com
	 */
	public class Tester extends Sprite
	{
		[Embed(source='f0.png')]
		public const SHEET:Class;

		public const SHEET_FRAME_WIDTH:Number = 48;
		public const SHEET_FRAME_HEIGHT:Number = 92;

		private var _ss:SpriteSheet;

		public function Tester()
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);

			createUI();
			createSpriteSheet();

		}

		private function createSpriteSheet():void
		{

			_ss = new SpriteSheet();
			_ss.build(new SHEET(), SHEET_FRAME_WIDTH, SHEET_FRAME_HEIGHT);
			_ss.x = _ss.y = 100
			addChild(_ss);

		}

		private function changeDirection(e:Event):void
		{
			var s:Sprite = Sprite(e.target);
			_ss.setDirection(s.name);
		}

		private function changeState(e:Event):void
		{
			var s:Sprite = Sprite(e.target);

			if (s.name == "idle")
			{
				_ss.idle();
			}
			else if (s.name == "action")
			{
				_ss.action();
			}
		}

		private function createUI():void
		{
			addChild(createButton("action", 10, 10, changeState));
			addChild(createButton("idle", 80, 10, changeState));

			addChild(createButton(Directions.S, 10, 40, changeDirection, 0x400080));
			addChild(createButton(Directions.SW, 80, 40, changeDirection, 0x400080));
			addChild(createButton(Directions.W, 150, 40, changeDirection, 0x400080));
			addChild(createButton(Directions.NW, 230, 40, changeDirection, 0x400080));
			addChild(createButton(Directions.N, 10, 70, changeDirection, 0x400080));
			addChild(createButton(Directions.NE, 80, 70, changeDirection, 0x400080));
			addChild(createButton(Directions.E, 150, 70, changeDirection, 0x400080));
			addChild(createButton(Directions.SE, 230, 70, changeDirection, 0x400080));

		}

		private function createButton(labelText:String, x:Number, y:Number, clickListener:Function, bgColor:uint = 0, labelColor:uint = 0xFFFFFF, width:Number = 60):Sprite
		{

			var label:TextField = new TextField();
			label.textColor = labelColor;
			label.autoSize = TextFieldAutoSize.LEFT;
			label.text = labelText;

			var s:Sprite = new Sprite();
			s.addChild(label);
			s.name = labelText;

			with (s)
			{
				graphics.beginFill(bgColor);
				graphics.drawRect(0, 0, 60, 20);
				graphics.endFill();
			}
			s.x = x;
			s.y = y;
			s.mouseChildren = false;
			s.addEventListener(MouseEvent.CLICK, clickListener);
			return s;
		}

	}

}