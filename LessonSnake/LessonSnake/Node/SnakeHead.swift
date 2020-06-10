//
//  SnakeHead.swift
//  LessonSnake
//
//  Created by Konstantin on 09.06.2020.
//  Copyright © 2020 Konstantin. All rights reserved.
//

import UIKit


class SnakeHead: SnakeBodyPart {
    override init(atPoint point: CGPoint) {
        super.init(atPoint: point)
        
        self.physicsBody?.categoryBitMask = CollisionCategories.SnekeHead
        self.physicsBody?.contactTestBitMask = CollisionCategories.EdgeBody | CollisionCategories.Apple | CollisionCategories.Snake
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
